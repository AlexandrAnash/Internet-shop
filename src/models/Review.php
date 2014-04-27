<?php
namespace App\Model;

class Review extends Entity
{
    public function getName()
    {
        return $this->_getData('name');
    }

    public function getEmail()
    {
        return $this->_getData('email');
    }

    public function getText()
    {
        return $this->_getData('text');
    }

    public function getRating()
    {
        return $this->_getData('rating');
    }

    public function getId()
    {
        return $this->_getData('review_id');
    }

    public function setProductId($productId)
    {
        $this->_data['product_id'] = $productId;
    }

    public function setCustomerId($customerId)
    {
        $this->_data['customer_id'] = $customerId;
    }

    public function setName($name)
    {
        $this->_data['name'] = $name;
    }

    public function setEmail($email)
    {
        $this->_data['email'] = $email;
    }

    public function setText($text)
    {
        $this->_data['text'] = $text;
    }

    public function setRating($rating)
    {
        $this->_data['rating'] = $rating;
    }

    public function belongsToProduct($product)
    {
        return (bool) ($product == $this->_getData('product')) ? true : false;
    }


} 