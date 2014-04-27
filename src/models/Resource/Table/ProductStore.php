<?php
namespace App\Model\Resource\Table;
class ProductStore implements ITable
{
    public function getName()
    {
        return 'product_store';
    }

    public function getPrimaryKey()
    {
        return 'product_store_id';
    }
}