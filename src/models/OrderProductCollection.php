<?php

namespace App\Model;

class OrderProductCollection
    implements \IteratorAggregate
{
    private $_resource;

    public function __construct(Resource\IResourceCollection $resource)
    {
        $this->_resource = $resource;
    }

    public function filterByOrder($order_id)
    {
        $this->_resource->filterBy('order_id', $order_id);
    }

    public function getOrderProducts()
    {
        return array_map(
            function($data) {
                return new OrderProduct($data);
            },
            $this->_resource->fetch()
        );
    }

    public function getIterator()
    {
        return new \ArrayIterator($this->getOrderProducts());
    }
}