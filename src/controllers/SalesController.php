<?php
namespace App\Controller;

use App\Model\Session;
use App\Model\Resource\Table\Customer as CustomerTable;
use App\Model\Resource\Table\Store as StoreTable;

class SalesController
    extends ActionController
{
    protected function _initQuote($collectorFactory = null)
    {
        $quote   = $this->_di->get('Quote', ['collectorsFactory' => $collectorFactory]);
        $session = $this->_di->get('Session');
        $customer = $this->_di->get('Customer');


        if ($session->isLoggedIn())
        {
            $customer->load($session->getCustomer());
            $quote->loadByCustomers($customer);
            $session->setQuoteId($customer->getQuoteId());
        }
        $quote->loadBySession($session);
        return $quote;
    }

    protected function getDistanseClientToStoresGoogle($address) {
        $resourceStore = $this->_di->get('ResourceCollection', ['table' => new StoreTable]);
        $stores = $this->_di->get('StoreCollection', ['resource' => $resourceStore]);

        $address_s = $this->_di->get('Address');
        $city = $this->_di->get('City');

        $distanceGoogle = [];
        $address_c = $address;
        $city->load($address_c->getCityId());
        $city_c = $city->getName();

        foreach ($stores as $s) {
            $address_s->load($s->getAddressId());
            $city->load($address_s->getCityId());
            $city_s = $city->getName();
            $distanceGoogle[] = $this->getApiGoogle($city_c, $city_s, $s);
        }
        return $distanceGoogle;
    }

    protected function getApiGoogle($origin, $destination, $s)
    {

        $routes = json_decode(file_get_contents(
            'http://maps.googleapis.com/maps/api/directions/json?origin=' . $origin . '&destination=' . $destination . '&alternatives=true&sensor=false'
        ))->routes;
        return [
            'store'         => $s,
            'start_address' => $routes[0]->legs[0]->start_address,
            'end_address'   => $routes[0]->legs[0]->end_address,
            'duration'      => $routes[0]->legs[0]->duration->text,
            'distance'      => (int)str_replace(',','',split(' ', $routes[0]->legs[0]->distance->text)[0])
        ];
    }
   //protected function _initQuote()
   //{
   //    $quote = $this->_di->get('Quote');
   //    $session = new Session; // get session
   //    if ($session->isLoggedIn()) {
   //        $quote->loadByCustomer($session->getCustomer());
   //        return $quote;
   //    } else {
   //        $quote->loadBySession($session->getSessionId());
   //        return $quote;
   //    }
   //}
}