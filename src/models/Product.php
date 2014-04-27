<?php
namespace App\Model;

class Product extends Entity
{
    public function getSku()
    {
        return $this->_getData('sku');
    }

    public function getName()
    {
        return $this->_getData('name');
    }

    public function getImage()
    {
        return $this->_getData('image');
    }

    public function getPrice()
    {
        return $this->_getData('price');
    }

    public function getSpecialPrice()
    {
        return $this->_getData('special_price');
    }

    public function isSpecialPriceApplied()
    {
        return (bool) $this->getSpecialPrice();
    }

    public function getId()
    {
        return $this->_getData('product_id');
    }

    public function getQty()
    {
        return $this->_getData('qty');
    }

    public function setSku($sku)
    {
        $this->_data['sku'] = $sku;
    }

    public function setName($name)
    {
        $this->_data['name'] = $name;
    }

    public function setImage($image)
    {
        $this->_data['image'] = $image;
    }

    public function setPrice($price)
    {
        $this->_data['price'] = $price;
    }

    public function setSpecialPrice($special_price)
    {
        $this->_data['special_price'] = $special_price;
    }

    public function setId($product_id)
    {
        $this->_data['product_id'] = $product_id;
    }

    public function setQty($qty)
    {
        $this->_data['qty'] = $qty;
    }






}