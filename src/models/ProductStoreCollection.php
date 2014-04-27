<?php

namespace App\Model;

class ProductStoreCollection
    implements \IteratorAggregate
{
    private $_resource;

    public function __construct(Resource\IResourceCollection $resource)
    {
        $this->_resource = $resource;
    }

    public function getProductStores()
    {
        return array_map(
            function($data) {
                return new ProductStore($data);
            },
            $this->_resource->fetch()
        );
    }

    public function filterByProduct($store)
    {
        $this->_resource->filterBy('store_id', $store->getId());
    }

    public function getIterator()
    {
        return new \ArrayIterator($this->getProductStores());
    }
}