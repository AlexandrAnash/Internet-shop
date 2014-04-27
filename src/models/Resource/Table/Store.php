<?php
namespace App\Model\Resource\Table;
class Store implements ITable
{
    public function getName()
    {
        return 'stores';
    }

    public function getPrimaryKey()
    {
        return 'store_id';
    }
}