<?php

namespace App\Model;

use Zend\Mail\Message;
use Zend\Mail\Transport\Smtp as SmtpTransport;
use Zend\Mail\Transport\SmtpOptions;
use Zend\Mime\Message as MimeMessage;
use Zend\Mime\Part as MimePart;


class Order extends Entity
{
    private $_itemsProduct = [];
    private $_OPCollection;


    public function __construct(
        array $data = [],
        Resource\IResourceEntity $resource = null,
        OrderProductCollection $OPCollection = null
    )
    {
        //var_dump($OPCollection->getOrderProducts());
        $this->_OPCollection = $OPCollection;
        parent::__construct($data, $resource);
    }
// <editor-fold desc="get Methods Order">
    public function getNumber()
    {
        return $this->_getData('number_order');
    }

    public function getCustomer()
    {
        return $this->_getData('customer_name');
    }
    public function getDate()
    {
        return $this->_getData('created_at');
    }

    public function getShippingMethod()
    {
        return $this->_getData('shipping_method');
    }
    public function getPaymentMethod()
    {
        return $this->_getData('payment_method');
    }
    public function getShipping()
    {
        return $this->_getData('shipping');
    }
    public function getSubtotal()
    {
        return $this->_getData('subtotal');
    }
    public function getGrandTotal()
    {
        return $this->_getData('grand_total');
    }
    public function getCity()
    {
        return $this->_getData('city');
    }

    public function getRegion()
    {
        return $this->_getData('region');
    }

    public function getPostalCode()
    {
        return $this->_getData('postal_code');
    }

    public function getStreet()
    {
        return $this->_getData('street');
    }

    public function getHomeNumber()
    {
        return $this->_getData('home_number');
    }

    public function getFlat()
    {
        return $this->_getData('flat');
    }

    public function getStatus()
    {
        return $this->_getData('status');
    }

    public function getDistance()
    {
        return $this->_getData('distance');
    }

    public function getDuration()
    {
        return $this->_getData('duration');
    }
// </editor-fold>


    public function setAddress(array $address)
    {
        foreach ($address as $key => $value)
        {
            $this->_data[$key] = $value;
        }
    }

    public function setDataQuoteTotal(array $dataQuote)
    {
        foreach ($dataQuote as $key => $value)
        {
            $this->_data[$key] = $value;
        }
    }

    public function setItemsProduct(ProductCollection $itemsProduct)
    {
        $this->_itemsProduct = $itemsProduct;
    }

    public function setNumber($data)
    {
        $this->_data['number_order'] = $data;
    }

    public function setStatus($data = 'Pending')
    {
        $this->_data['status'] = $data;
    }
    public function setDistance($data)
    {
        $this->_data['distance'] = $data;
    }
    public function setDuration($data)
    {
        $this->_data['duration'] = $data;
    }


    public function sendEmail($dist)
    {

        $messageContent = "";
        $this->setNumber($this->getId()+10000);
        $this->setStatus();
        $this->_OPCollection->filterByOrder($this->getId());

        if ($this->_getData('customer_name'))
        $messageContent .= "Sent a message " . $this->_getData('customer_name') . '<br>';
    else
        $messageContent .= "Sent a message " . "Guest" . '<br>' ;

        $messageContent .= "<br>";

        $messageContent .= 'Number order: ' . $this->_getData('number_order') . '<br>';

        $messageContent .= 'Date ordering: ' . $this->_getData('created_at') . '<br>';

        $messageContent .= "Products: <br>";
        $messageContent .= '<div style="margin-left: 50px">';
        foreach ($this->_OPCollection as $key => $product)
        {
            $messageContent .= "---------------------------------------<br>";
            $messageContent .= 'Name - ' . $product->getProductName() . '<br>';
            $messageContent .= 'Sku - ' . $product->getProductSku() . '<br>';
            $messageContent .= 'Count - ' . $product->getProductQty() . '<br>';
            $messageContent .= 'Price - ' . $product->getProductPrice() . '<br>';
            $messageContent .= "---------------------------------------<br>";

            $messageContent .= "---------------------------------------<br>";
            $messageContent .= "Minimum shipping time - " . $dist[$key]['duration'] . '<br>';
            $messageContent .= "---------------------------------------<br>";
            $this->setDistance($dist[$key]['distance']);
            $this->setDuration($dist[$key]['duration']);
        }
        $messageContent .= "</div>";

        $messageContent .= 'Address:<br>';
        $messageContent .= '<div style="margin-left: 50px">';
        $messageContent .= "---------------------------------------<br>";
        $messageContent .= 'city - ' . $this->_getData('city') . '<br>';
        $messageContent .= 'region - ' . $this->_getData('region') . '<br>';
        $messageContent .= 'postal_code - ' . $this->_getData('postal_code') . '<br>';
        $messageContent .= 'street - ' . $this->_getData('street') . '<br>';
        $messageContent .= 'home_number - ' . $this->_getData('home_number') . '<br>';
        $messageContent .= 'flat - ' . $this->_getData('flat') . '<br>';
        $messageContent .= "---------------------------------------<br>";
        $messageContent .= "</div>";
        $messageContent .= 'Results by order:<br>';
        $messageContent .= '<div style="margin-left: 50px">';
        $messageContent .= "---------------------------------------<br>";
        $messageContent .= 'shipping method - ' . $this->_getData('shipping_method') . '<br>';
        $messageContent .= 'payment method - ' . $this->_getData('payment_method') . '<br>';
        $messageContent .= 'shipping - ' . $this->_getData('shipping') . '<br>';
        $messageContent .= 'subtotal - ' . $this->_getData('subtotal') . '<br>';
        $messageContent .= 'grand total - ' . $this->_getData('grand_total') . '<br>';
        $messageContent .= 'status order - ' . $this->_getData('status') . '<br>';
        $messageContent .= "---------------------------------------<br>";
        $messageContent .= "</div>";



        echo html_entity_decode($messageContent);
//      $html = new MimePart($messageContent);
//      $html->type = "text/html";
//      $body = new MimeMessage();
//      $body->setParts(array($html));
//     $message = new Message();
//     $message->addTo('probnik012@gmail.com')
//         ->addFrom('probnik012@gmail.com')
//         ->setSubject('Greetings and Salutations!')
//         ->setBody($body);
//
//     $transport = new SmtpTransport();
//     $options   = new SmtpOptions(array(
//         'name'              => 'localhost.localdomain',
//         'host'              => 'smtp.gmail.com',
//         'port'              => '587',
//         'connection_class'  => 'login',
//         'connection_config' => array(
//             'username' => 'probnik012@gmail.com',
//             'password' => 'probnik123qweasd',
//             'ssl' => 'tls'
//         ),
//     ));
//     $transport->setOptions($options);
//     $transport->send($message);

    }


}