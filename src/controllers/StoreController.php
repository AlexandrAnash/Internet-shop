<?php
namespace App\Controller;

use App\Model\Resource\Table\Store as StoreTable;
use App\Model\Resource\Table\ProductStore as ProductStoreTable;


class StoreController
    extends SalesController
{

    public function __construct(\Zend\Di\Di $di)
    {
        $this->_di = $di;
    }

    public function listAction()
    {

        $resource = $this->_di->get('ResourceCollection', ['table' => new StoreTable]);
        $paginator = $this->_di->get('Paginator', ['collection' => $resource]);
        $stores = $this->_di->get('StoreCollection', ['resource' => $resource]);
        $address = $this->_di->get('Address');
        $addressList = array();
        $cityList = array();
        $city = $this->_di->get('City');
        $cityResource = $this->_di->get('ResourceCollection', ['table' => new \App\Model\Resource\Table\City]);
        $cityCollection = $this->_di->get('CityCollection', ['resource' => $cityResource, 'cityPrototype' => $city]);

        $region = $this->_di->get('Region');
        $regionResource = $this->_di->get('ResourceCollection', ['table' => new \App\Model\Resource\Table\Region]);
        $regionCollection = $this->_di->get('RegionCollection', ['resource' => $regionResource, 'regionPrototype' => $region]);

//        foreach ($stores->getStores() as $key => $store) {
//            $address->load($store->getAddressId());
//            $city->load($address->getCityId());
//            $cityList[$key] =  $city->getName();
//            $addressList[$key]['postal'] =  $address->getPostalCode();
//            $addressList[$key]['street'] =  $address->getStreet();
//            $addressList[$key]['homeNumber'] =  $address->getHomeNumber();
//            $addressList[$key]['flat'] =  $address->getFlat();
//        }
        $paginator
            ->setItemCountPerPage(2)
            ->setCurrentPageNumber(isset($_GET['p']) ? $_GET['p'] : 1);
        $pages = $paginator->getPages();
        return $this->_di->get('View', [
            'template' => 'store_list',
            'params'   => [
                'city'          => $cityCollection->getCities(),
                'region'        => $regionCollection->getRegions(),
                'stores'        => $stores,
                'pages'         => $pages
//                'addressList'   => $addressList,
//                'cityList'      => $cityList
            ]
        ]);
    }

    public function viewAction()
    {
        $store = $this->_di->get('Store');
        $store->load($_GET['id']);
        $address = $this->_di->get('Address');
        $city = $this->_di->get('City');
        $resource = $this->_di->get('ResourceCollection', ['table' => new ProductStoreTable]);
        $paginator = $this->_di->get('Paginator', ['collection' => $resource]);
        $productStores = $this->_di->get('ProductStoreCollection', ['resource' => $resource]);
        $productStores->filterByProduct($store);
        $address->load($store->getAddressId());
        $city->load($address->getCityId());
        $paginator
            ->setItemCountPerPage(2)
            ->setCurrentPageNumber(isset($_GET['p']) ? $_GET['p'] : 1);
        $pages = $paginator->getPages();
        return $this->_di->get('View', [
            'template' => 'store_view',
            'params'   => [
                'store' => $store,
                'productStores' => $productStores,
                'pages'         => $pages,
                'address'       =>$address,
                'city'          => $city
            ]
        ]);
    }

    public function addAction()
    {
        $store = $this->_di->get('Store');
        $address = $this->_di->get('Address');

        $address->setData($_POST['address']);
        $address->save();
        if (!isset($_POST['store']['address_id']))
            $_POST['store']['address_id'] = $address->getId();

        $store->setData($_POST['store']);
        $store->save();
        $this->_redirect('store_list');
    }

    public function editAction()
    {
        $store = $this->_di->get('Store');
        $address = $this->_di->get('Address');
        $city = $this->_di->get('City');
        $cityResource = $this->_di->get('ResourceCollection', ['table' => new \App\Model\Resource\Table\City]);
        $cityCollection = $this->_di->get('CityCollection', ['resource' => $cityResource, 'cityPrototype' => $city]);

        $region = $this->_di->get('Region');
        $regionResource = $this->_di->get('ResourceCollection', ['table' => new \App\Model\Resource\Table\Region]);
        $regionCollection = $this->_di->get('RegionCollection', ['resource' => $regionResource, 'regionPrototype' => $region]);

        $store->load($_GET['store_id']);
        $address->load($store->getAddressId());


        return $this->_di->get('View', [
            'template' => 'store_edit',
            'params'   => [
                'store' => $store,
                'cities' => $cityCollection->getCities(),
                'regions' => $regionCollection->getRegions(),
                'address' => $address
            ]
        ]);
    }
    public function deleteAction()
    {
        $store = $this->_di->get('Store');
        $store->load($_GET['store_id']);
        $store->remove();
        $this->_redirect('store_list');
    }

    public function addProductStoreAction()
    {
        $saved = false;
        $postProduct = $_POST['productStore'];
        $store_id = $postProduct['store_id'];
        $store = $this->_di->get('Store');
        $store->load($store_id);
        $resource = $this->_di->get('ResourceCollection', ['table' => new ProductStoreTable]);
        $productStores = $this->_di->get('ProductStoreCollection', ['resource' => $resource]);
        $productStores->filterByProduct($store);
        $ProductStore = $this->_di->get('ProductStore');

        foreach ($productStores as $ps) {
            if ($ps->getSku() == $postProduct['sku']) {
                $ProductStore->load($ps->getId());
                $ProductStore->setQty($ProductStore->getQty() + $postProduct['qty']);
                $saved = true;
            }

        }
        if (!$saved) {
            $ProductStore->setData($postProduct);
        }
        $ProductStore->save();
        $param = ['id' => $store_id];
        $this->_redirect('store_view', $param);
    }

    public function deleteProductStoreAction()
    {
        $ProductStore = $this->_di->get('ProductStore');
        $ProductStore->load($_GET['product_store_id']);
        $ProductStore->remove();
        $param = ['id' => $_GET['id']];
        $this->_redirect('store_view', $param);
    }

}