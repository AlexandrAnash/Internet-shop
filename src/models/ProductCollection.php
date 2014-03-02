<?php

namespace App\Model;

class ProductCollection
    implements \IteratorAggregate
{
    private $_resource;
    private $_items;

    public function __construct(Resource\IResourceCollection $resource)
    {
        $this->_resource = $resource;
    }

    public function getProducts()
    {
        return array_map(
            function($data) {
                return new Product($data);
            },
            $this->_resource->fetch()
        );
    }

    public function getItems()
    {

        if (!$this->_items) {
            $this->_items = array_map(
                function ($data) {
                    $item = new Product();
                    $item->setData($data);
                    return $item;
                },
                $this->_resource->fetch()
            );
        }
        return $this->_items;
    }

    public function getIterator()
    {
        return new \ArrayIterator($this->getProducts());
    }
}