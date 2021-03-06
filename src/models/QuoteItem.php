<?php
namespace App\Model;

class QuoteItem
    extends Entity
{
    private $_product;

    public function getProductId()
    {
        return $this->_data['product_id'];
    }

    public function belongsToProduct(Product $product)
    {
        return $this->getProductId() == $product->getId();
    }

    public function assignToProduct(Product $product)
    {
        $this->_data['product_id'] = $product->getId();
        $this->_product = $product;
    }

    public function getProduct()
    {
        return $this->_product;
    }

    public function getQty()
    {
        return $this->_data['qty'];
    }

    public function addQty($qty)
    {
        if ($qty > 0) {
            $this->_data['qty'] = $this->_getData('qty') + $qty;
        }
    }

    public function delete($qty)
    {
        if ($qty > 0 && $this->_data['qty'] >= $qty)
            $this->_data['qty'] -= $qty;
    }

    public function assignToQuote($quote)
    {
        $this->_data['quote_id'] = $quote->getId();
    }

    public function remove()
    {
        $this->_resource->remove($this->getId());
    }
}