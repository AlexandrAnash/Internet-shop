<?php
namespace App\Model;

class ProductStore extends Entity
{
    public function getStoreId()
    {
        return $this->_getData('store_id');
    }

    public function getSku()
    {
        return $this->_getData('sku');
    }

    public function getQty()
    {
        return $this->_getData('qty');
    }

    public function getId()
    {
        return $this->_getData('product_store_id');
    }

    public function setStoreId($store_id)
    {
        $this->_data['store_id'] = $store_id;
    }

    public function setSku($sku)
    {
        $this->_data['sku'] = $sku;
    }

    public function setQty($qty)
    {
        $this->_data['qty'] = $qty;
    }

    public function setId($product_store_id)
    {
        $this->_data['product_store_id'] = $product_store_id;
    }




}