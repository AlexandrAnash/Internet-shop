<?php
namespace App\Model\Resource\Table;
class OrderProduct implements ITable
{
    public function getName()
    {
        return 'order_products';
    }

    public function getPrimaryKey()
    {
        return 'order_product_id';
    }
}