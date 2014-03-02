<?php

namespace App\Model;

use Zend\Mail\Message;
use Zend\Mail\Transport\Smtp as SmtpTransport;
use Zend\Mail\Transport\SmtpOptions;
use Zend\Mime\Message as MimeMessage;
use Zend\Mime\Part as MimePart;


class OrderProduct extends Entity
{
    private $_itemsProduct = [];
// <editor-fold desc="get Methods order product">
    public function getOrderId()
    {
        return $this->_getData('order_id');
    }

    public function getProductName()
    {
        return $this->_getData('product_name');
    }
    public function getProductSku()
    {
        return $this->_getData('product_sku');
    }
    public function getProductQty()
    {
        return $this->_getData('qty');
    }
    public function getProductPrice()
    {
        return $this->_getData('product_price');
    }
// </editor-fold>

// <editor-fold desc="set Methods order product">
    public function setOrderId($data)
    {
        $this->_data['order_id'] = $data;
    }

    public function setProductName($data)
    {
        $this->_data['product_name'] = $data;
    }

    public function setProductSku($data)
    {
        $this->_data['product_sku'] = $data;
    }

    public function setProductQty($data)
    {
        $this->_data['qty'] = $data;
    }
    public function setProductPrice($data)
    {
        $this->_data['product_price'] = $data;
    }
// </editor-fold>

}