<?php
namespace App\Model;

class Store extends Entity
{
    public function getName()
    {
        return $this->_getData('name');
    }

    public function getAddressId()
    {
        return $this->_getData('address_id');
    }

    public function getId()
    {
        return $this->_getData('store_id');
    }

    public function setName($name)
    {
        $this->_data['name'] = $name;
    }

    public function setAddressId($address_id)
    {
        $this->_data['address_id'] = $address_id;
    }

    public function setId($store_id)
    {
        $this->_data['store_id'] = $store_id;
    }




}