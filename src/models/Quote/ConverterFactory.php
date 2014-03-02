<?php

namespace App\Model\Quote;


use App\Model\City;
use App\Model\Customer;
use App\Model\OrderProduct;
use App\Model\Product;
use App\Model\Quote;
use App\Model\Region;
use App\Model\Review;

class ConverterFactory
{
    private $_prototypeProduct;
    private $_prototypeCustomer;
    public function __construct(Product $prototypeProduct, Customer $prototypeCustomer,
                                City $prototypeCity, Region $prototypeRegion, OrderProduct $prototypeOrderProduct
    )
    {
        $this->_prototypeProduct = $prototypeProduct;
        $this->_prototypeOrderProduct = $prototypeOrderProduct;
        $this->_prototypeCustomer = $prototypeCustomer;
        $this->_prototypeCity = $prototypeCity;
        $this->_prototypeRegion = $prototypeRegion;
    }

    public function getConverters()
    {
        return [
            new DataConverter($this->_prototypeCustomer),
            new ItemsConverter($this->_prototypeProduct, $this->_prototypeOrderProduct),
            new AddressConverter($this->_prototypeCity, $this->_prototypeRegion)
        ];
    }

} 