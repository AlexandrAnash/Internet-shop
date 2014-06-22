<?php
namespace App\Controller;

use App\Model\QuoteCollection;
use Zend\Mail\Transport\Smtp as SmtpTransport;
use Zend\Mail\Transport\SmtpOptions;
use App\Model\Resource\Table\Store as StoreTable;
use App\Model\Resource\Table\ProductStore as ProductStoreTable;
use App\Model\Resource\Table\Product as ProductTable;


class CheckoutController
    extends SalesController
{
    public function addressAction()
    {
        if (isset($_POST['address'])) {
            $quote = $this->_initQuote();
            $address = $quote->getAddress();
            $address->setData($_POST['address']);
            $address->save();
            $this->_redirect('checkout_shipping');
        } else {
            $city = $this->_di->get('City');
            $cityResource = $this->_di->get('ResourceCollection', ['table' => new \App\Model\Resource\Table\City]);
            $cityCollection = $this->_di->get('CityCollection', ['resource' => $cityResource, 'cityPrototype' => $city]);

            $region = $this->_di->get('Region');
            $regionResource = $this->_di->get('ResourceCollection', ['table' => new \App\Model\Resource\Table\Region]);
            $regionCollection = $this->_di->get('RegionCollection', ['resource' => $regionResource, 'regionPrototype' => $region]);

            return $this->_di->get('View', [
                'template' => 'checkout_address',
                'params' => [
                    'cities' => $cityCollection->getCities(),
                    'regions' => $regionCollection->getRegions(),
                    'view' => 'checkout_address'
                ]
            ]);
        }
    }

    public function shippingAction()
    {
        $quote = $this->_initQuote();
        if (isset($_POST['method'])) {
            $quote->setShippingData($_POST['method']);
            $this->_redirect('checkout_payment');
        } else {
            $address = $quote->getAddress();
            $factory = $this->_di->get('ShippingFactory', ['address' => $address]);
            $methods = $factory->getMethods();

            $methodsArray = [];
            foreach ($methods as $method) {
                $methodsArray[] = [
                    'code' => $method->getCode(),
                    'price' => $method->getPrice(),
                    'label' => $method->getLabel()];
            }

            return $this->_di->get('View', [
                'template' => 'checkout_shipping',
                'params' => ['methods' => $methodsArray]
            ]);
        }
    }

    public function paymentAction()
    {
        $quote = $this->_initQuote();
        if (isset($_POST['method'])) {
            $quote->setPaymentData($_POST['method']);
            $this->_redirect('checkout_order');
        } else {
            $methods = $this->_di->get('PaymentFactory')
                ->getMethods()
                ->available($quote->getAddress());
            return $this->_di->get('View', [
                'template' => 'checkout_payment',
                'params' => ['methods' => $methods]
            ]);
        }
    }

    public function orderAction()
    {
        $quote = $this->_initQuote();
        $quote->collectTotals();
        $quote->save();
        if ($this->_isPost()) {
            $dist = $this->optimizationShipping($quote);
            $order = $this->_di->get('Order');
            $order->save();
            $this->_di->get('QuoteConverter')
                ->toOrder($quote, $order);
            $order->sendEmail($dist);
            $order->save();
            header("Location: /?page=product_list");
        } else {
            return $this->_di->get('View', [
                'template' => 'checkout_order',
                'params' => [
                    'subtotal' => $quote->getSubtotal(),
                    'shipping' => $quote->getShipping(),
                    'grand_total' => $quote->getGrandTotal()
                ]
            ]);

        }
    }

    private function optimizationShipping($quote)
    {

        $resourceProductStore = $this->_di->get('ResourceCollection', ['table' => new ProductStoreTable]);
        $productStores = $this->_di->get('ProductStoreCollection', ['resource' => $resourceProductStore]);

        $distanceGoogle = $this->getDistanceClientToStoresGoogle($quote->getAddress());
        echo '<pre>';
        var_dump($distanceGoogle);
        echo '</pre>';

    $distance = [];
        $returnDistance = [];
        foreach ($distanceGoogle as $key => $row)
        {
            $distance[$key] = $row['distance'];
        }
        array_multisort($distance, SORT_ASC, $distanceGoogle);
        $count = [];
        foreach ($quote->getItems() as $q) {
            array_push($count, $q->getQty());
        }
        echo '<pre>';
        var_dump($count);
        echo '</pre>';

        foreach ($distanceGoogle as $dg) {
            foreach ($quote->getItems() as $key => $q) {
                $product = $this->_di->get('Product');
                $product->load($q->getProductId());
                if ($count[$key] != 0) {
                    foreach ($productStores as $ps) {
                        if ($ps->getSku() == $product->getSku() && $ps->getStoreId() == $dg["store"]->getId()) {
                            if ($ps->getQty() != 0) {
                                if ($ps->getQty() > $count[$key]) {
                                    $count[$key]= 0;
                                    $ps->setQty($ps->getQty() - $q->getQty());
                                    $this->savePStore($ps);
                                    $returnDistance[] = $dg;
                                } else {
                                    if ($ps->getQty() == $count[$key]) {
                                        $count[$key] = $ps->getQty() - $count[$key];
                                        $ps->setQty($ps->getQty() - $q->getQty());
                                        $this->savePStore($ps);
                                        $returnDistance[] = $dg;
                                    } else {
                                        $count[$key] = $count[$key] - $ps->getQty();
                                        $ps->setQty(0);
                                        $this->savePStore($ps);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        echo '<pre>';
//        var_dump($quote->getQty());
        echo '</pre>';
        return $returnDistance;
    }

    private function savePStore($ps) {
        $PStore = $this->_di->get('ProductStore');
        $PStore->setStoreId($ps->getStoreId());
        $PStore->setSku($ps->getSku());
        $PStore->setQty($ps->getQty());
        $PStore->setId($ps->getId());
        $PStore->save();
    }



}