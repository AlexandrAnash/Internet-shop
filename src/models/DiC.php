<?php

namespace App\Model;

use Zend\Di\Di;

class DiC
{
    private $_di;
    private $_im;

    public function __construct(Di $di)
    {
        $this->_di = $di;
        $this->_im = $di->instanceManager();
    }

    public function assemble()
    {
        $reflection = new \ReflectionClass($this);
        foreach ($reflection->getMethods(\ReflectionMethod::IS_PRIVATE) as $_method)
        {
            if (strpos($_method->getName(), '_assemble') === 0)
            {
                $_method->setAccessible(true);
                $_method->invoke($this);
            }
        }
    }

    private function _assembleDbConnection()
    {
        $connection = new \PDO('mysql:host=localhost;dbname=shop', 'root', '123');
        $this->_im->setParameters('App\Model\Resource\DBCollection', ['connection' => $connection]);
        $this->_im->setParameters('App\Model\Resource\DBEntity', ['connection' => $connection]);
    }

    private function _assembleResources()
    {
        $this->_im->addTypePreference('App\Model\Resource\IResourceCollection', 'App\Model\Resource\DBCollection');
        $this->_im->addTypePreference('App\Model\Resource\IResourceEntity', 'App\Model\Resource\DBEntity');
        $this->_im->addAlias('ResourceCollection', 'App\Model\Resource\DBCollection');
        $this->_im->addAlias('ResourceEntity', 'App\Model\Resource\DBEntity');

        $this->_im->setShared('App\Model\Resource\DBEntity', false);
        $this->_im->setShared('App\Model\Resource\DBCollection', false);
    }

    private function _assemblePaginator()
    {
        $this->_im->setParameters('Zend\Paginator\Paginator', ['adapter' => 'App\Model\Resource\Paginator']);
        $this->_im->addAlias('Paginator', 'Zend\Paginator\Paginator');
    }

    private function _assembleProducts()
    {
        $this->_im->setParameters('App\Model\ProductCollection', ['table' => 'App\Model\Resource\Table\Product']);
        $this->_im->addAlias('ProductCollection', 'App\Model\ProductCollection');

        $this->_im->setParameters('App\Model\Product', ['table' => 'App\Model\Resource\Table\Product']);
        $this->_im->addAlias('Product', 'App\Model\Product');
    }

    private function _assembleStores()
    {
        $this->_im->setParameters('App\Model\StoreCollection', ['table' => 'App\Model\Resource\Table\Store']);
        $this->_im->addAlias('StoreCollection', 'App\Model\StoreCollection');

        $this->_im->setParameters('App\Model\Store', ['table' => 'App\Model\Resource\Table\Store']);
        $this->_im->addAlias('Store', 'App\Model\Store');
    }

    private function _assembleProductStore()
    {
        $this->_im->setParameters('App\Model\ProductStoreCollection', ['table' => 'App\Model\Resource\Table\ProductStore']);
        $this->_im->addAlias('ProductStoreCollection', 'App\Model\ProductStoreCollection');

        $this->_im->setParameters('App\Model\ProductStore', ['table' => 'App\Model\Resource\Table\ProductStore']);
        $this->_im->addAlias('ProductStore', 'App\Model\ProductStore');
    }


    private function _assembleReview()
    {
        $this->_im->setParameters('App\Model\ReviewCollection', ['table' => 'App\Model\Resource\Table\Review']);
        $this->_im->addAlias('ReviewCollection', 'App\Model\ReviewCollection');

        $this->_im->setParameters('App\Model\Review', ['table' => 'App\Model\Resource\Table\Review']);
        $this->_im->addAlias('Review', 'App\Model\Review');
    }

    private function _assemblePayment()
    {
        $this->_im->setParameters('App\Model\Payment\Factory', ['collection' => 'App\Model\Payment\Collection']);
        $this->_im->addAlias('PaymentFactory', 'App\Model\Payment\Factory');
    }
    private function _assembleCustomer()
    {
        $this->_im->setParameters('App\Model\CustomerCollection', ['table' => 'App\Model\Resource\Table\Customer']);
        $this->_im->addAlias('CustomerCollection', 'App\Model\CustomerCollection');

        $this->_im->setParameters('App\Model\Customer', ['table' => 'App\Model\Resource\Table\Customer']);
        $this->_im->addAlias('Customer', 'App\Model\Customer');
    }

    private function _assembleAdmin()
    {
        $this->_im->setParameters('App\Model\AdminCollection', ['table' => 'App\Model\Resource\Table\Admin']);
        $this->_im->addAlias('AdminCollection', 'App\Model\AdminCollection');

        $this->_im->setParameters('App\Model\Admin', ['table' => 'App\Model\Resource\Table\Admin']);
        $this->_im->addAlias('Admin', 'App\Model\Admin');
    }

    private function _assembleCity()
    {
        $this->_im->setParameters('App\Model\City', ['table' => 'App\Model\Resource\Table\City']);
        $this->_im->addAlias('City', 'App\Model\City');

        $this->_im->setParameters('App\Model\CityCollection', ['table' => 'App\Model\Resource\Table\City']);
        $this->_im->addAlias('CityCollection', 'App\Model\CityCollection');
        $this->_im->setShared('App\Model\CityCollection', false);
        $this->_im->setShared('App\Model\City', false);


    }
    private function _assembleRegion()
    {
        $this->_im->setParameters('App\Model\Region', ['table' => 'App\Model\Resource\Table\Region']);
        $this->_im->addAlias('Region', 'App\Model\Region');

        $this->_im->setParameters('App\Model\RegionCollection', ['table' => 'App\Model\Resource\Table\Region']);
        $this->_im->addAlias('RegionCollection', 'App\Model\RegionCollection');
    }

    private function _assembleOrderProduct()
    {
        $this->_im->setParameters('App\Model\OrderProduct', ['table' => 'App\Model\Resource\Table\OrderProduct']);
        $this->_im->addAlias('OrderProduct', 'App\Model\OrderProduct');
    }

    private function _assembleConverterFactory()
    {
        $this->_im->setParameters('App\Model\Quote\ConverterFactory', [

            'prototypeProduct' => $this->_di->get('App\Model\Product'),
            'prototypeCustomer' => $this->_di->get('App\Model\Customer'),
            'prototypeCity' => $this->_di->get('App\Model\City'),
            'prototypeRegion' => $this->_di->get('App\Model\Region'),
            'prototypeOrderProduct' => $this->_di->get('App\Model\OrderProduct'),

        ]);
    }

    private function _assembleConverter()
    {
        $this->_im->setParameters('App\Model\Quote\Converter', ['converterFactory' => 'App\Model\Quote\ConverterFactory']);
        $this->_im->addAlias('QuoteConverter', 'App\Model\Quote\Converter');
    }

    private function _assembleAddress()
    {
        $this->_im->setParameters('App\Model\Address', ['table' => 'App\Model\Resource\Table\Address']);
        $this->_im->addAlias('Address', 'App\Model\Address');
        $this->_im->setShared('App\Model\Address', false);
    }

    private function _assembleCollectors()
    {
        $this->_im->setParameters('App\Model\Quote\CollectorsFactory', [
            'product' => $this->_di->get('App\Model\Product')
        ]);
    }

    private function _assembleFactory()
    {
        $this->_im->setParameters('App\Model\Shipping\Factory', []);
        $this->_im->addAlias('ShippingFactory', 'App\Model\Shipping\Factory');

        $this->_im->setParameters('App\Model\Payment\Factory', []);
        $this->_im->addAlias('PaymentFactory', 'App\Model\Payment\Factory');

     }

    private function _assembleQuote()
    {
        $this->_im->setParameters('App\Model\QuoteItem', ['table' => 'App\Model\Resource\Table\QuoteItem']);
        $this->_im->addAlias('QuoteItem', 'App\Model\QuoteItem');

        $this->_im->setParameters('App\Model\QuoteItemCollection', [
            'table' => 'App\Model\Resource\Table\QuoteItem',
            'itemPrototype' => 'App\Model\QuoteItem'
        ]);
        $this->_im->addAlias('QuoteItemCollection', 'App\Model\QuoteItemCollection');

        $this->_im->setParameters('App\Model\Quote', [
            'table' => 'App\Model\Resource\Table\Quote',
            'items' => $this->_di->get('App\Model\QuoteItemCollection'),
            'address' => $this->_di->get('App\Model\Address'),
            'collectorsFactory' => $this->_di->get('App\Model\Quote\CollectorsFactory')

        ]);

        $this->_im->addAlias('Quote', 'App\Model\Quote');



        $this->_im->setShared('App\Model\QuoteItemCollection', false);
    }



    private function _assembleOrderProductCollection()
    {
        $this->_im->setParameters('App\Model\OrderProductCollection', ['table' => 'App\Model\Resource\Table\OrderProduct']);
        $this->_im->addAlias('OrderProductCollection', 'App\Model\OrderProductCollection');

        $this->_im->setShared('App\Model\OrderProductCollection', false);
    }

    private function _assembleOrder()
    {
        $this->_im->setParameters('App\Model\Order', [
            'table' => 'App\Model\Resource\Table\Order',
            'OPCollection' => $this->_di->get('App\Model\OrderProductCollection'),

        ]);
        $this->_im->addAlias('Order', 'App\Model\Order');

    }

    private function _assembleOrderCollection()
    {
        $this->_im->setParameters('App\Model\OrderCollection', [
            'table' => 'App\Model\Resource\Table\Order',
            'itemPrototype' => 'App\Model\Order',
        ]);
        $this->_im->addAlias('OrderCollection', 'App\Model\OrderCollection');

        $this->_im->setShared('App\Model\OrderProductCollection', false);
        $this->_im->setShared('App\Model\Order', false);
    }


    private function _assembleView()
    {
        $this->_im->setParameters('App\Model\ModelView', [
            'layoutDir'   => __DIR__ . '/../views/layout/',
            'templateDir' => __DIR__ . '/../views/',
            'layout'      => 'base',
            'params'      => [],
        ]);
        $this->_im->addAlias('View', 'App\Model\ModelView');
    }

    private function _assembleSession()
    {
        $this->_im->addAlias('Session', 'App\Model\Session');
        $this->_im->setParameters('App\Model\ISessionUser', [
            'session' => $this->_di->get('Session')
        ]);
    }
} 