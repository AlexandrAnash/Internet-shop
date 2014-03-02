<?php

namespace App\Model\Quote;


use App\Model\Order;
use App\Model\OrderProduct;
use App\Model\Product;
use App\Model\Quote;

class ItemsConverter
    implements IConverter
{
    private $_prototypeProduct;
    private $_prototypeOrderProduct;

    public function __construct(Product $prototypeProduct, OrderProduct $prototypeOrderProduct)
    {
        $this->_prototypeProduct = $prototypeProduct;
        $this->_prototypeOrderProduct = $prototypeOrderProduct;

    }


    public function toOrder(Quote $quote, Order $order)
    {
        $items = [];
        foreach ($quote->getItems() as $item)
        {
            $productOrder = clone $this->_prototypeOrderProduct;
            $this->_prototypeProduct->load($item->getProductId());
            $price = ($this->_prototypeProduct->isSpecialPriceApplied()) ?
                $this->_prototypeProduct->getSpecialPrice() : $this->_prototypeProduct->getPrice();
            $productOrder->setOrderId($order->getId());
            $productOrder->setProductName($this->_prototypeProduct->getName());
            $productOrder->setProductSku($this->_prototypeProduct->getSku());
            $productOrder->setProductQty($item->getQty());
            $productOrder->setProductPrice($price);
            $productOrder->save();



            //$items[] = [
            //    'product_name' => $this->_product->getName(),
            //    'product_sku' => $this->_product->getSku(),
            //    'product_qty' => $item->getQty(),
            //    'product_price' => $price
//
            //    ];
        }

    }
}