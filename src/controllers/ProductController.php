<?php
namespace App\Controller;

use App\Model\Resource\Table\Review as ReviewTable;
use App\Model\Resource\Table\Product as ProductTable;
use App\Model\Resource\Table\ProductStore as ProductStoreTable;


class ProductController
    extends SalesController
{
    public function __construct(\Zend\Di\Di $di)
    {
        $this->_di = $di;
    }

    public function listAction()
    {

        $resource = $this->_di->get('ResourceCollection', ['table' => new ProductTable]);
        $resourceStore = $this->_di->get('ResourceCollection', ['table' => new ProductStoreTable]);
        $paginator = $this->_di->get('Paginator', ['collection' => $resource]);
        $products = $this->_di->get('ProductCollection', ['resource' => $resource]);
        $ProductStores = $this->_di->get('ProductStoreCollection', ['resource' => $resourceStore]);
//        $type_product = isset($_GET['type']) ? $_GET['type'] : "phone";
//        $products->filterByProduct($type_product);
        $productObj = $this->_di->get('Product');

//        $paginator
//            ->setItemCountPerPage(6)
//            ->setCurrentPageNumber(isset($_GET['p']) ? $_GET['p'] : 1);
//        $pages = $paginator->getPages();

        foreach ($products as $key => $product) {
            $qty = 0;
            foreach ($ProductStores as $productStore) {
                if ($productStore->getSku() == $product->getSku()) {
                    $qty += $productStore->getQty();
                }
            }
            $productObj->load($product->getId());
            $productObj->setQty($qty);
            $productObj->save();
        }
        foreach ($products as $product) {
            if ($type_product = 'Mobile phone'){

            }

        }


        return $this->_di->get('View', [
            'template' => 'product_list',
            'params'   => ['products' => $products]
//            'params'   => ['products' => $products, 'pages' => $pages]
        ]);
    }


    public function viewAction()
    {
        $product = $this->_di->get('Product');
        $product->load($_GET['id']);
        $resourceReview = $this->_di->get('ResourceCollection', ['table' => new ReviewTable]);
        $paginator = $this->_di->get('Paginator', ['collection' => $resourceReview]);
        $reviews = $this->_di->get('ReviewCollection', ['resource' => $resourceReview]);
        $reviews->filterByProduct($product);
        $paginator
            ->setItemCountPerPage(2)
            ->setCurrentPageNumber(isset($_GET['p']) ? $_GET['p'] : 1);
        $pages = $paginator->getPages();
        return $this->_di->get('View', [
            'template' => 'product_view',
            'params'   => ['product' => $product, 'reviews' => $reviews, 'pages' => $pages]
        ]);
    }

        public function addAction()
    {
        $product = $this->_di->get('Product');
        if ($_POST['product']['product_id'])
            $product->setId($_POST['product']['product_id']);

        $product->setSku($_POST['product']['sku']);
        $product->setName($_POST['product']['name']);
        $product->setImage($_POST['product']['image']);
        $product->setDescription($_POST['product']['description']);
        $product->setTypeProduct($_POST['product']['type_product']);
        $product->setPrice($_POST['product']['price']);
        $product->setSpecialPrice($_POST['product']['special_price']);
        $product->save();
        $this->_redirect('product_list');
    }

        public function editAction()
    {
        $product = $this->_di->get('Product');
        $product->load($_GET['product_id']);
        return $this->_di->get('View', [
            'template' => 'product_edit',
            'params'   => ['product' => $product]
        ]);
    }
        public function deleteAction()
    {
        $product = $this->_di->get('Product');
        $product->load($_GET['product_id']);
        $product->remove();
        $this->_redirect('product_list');
    }
        public function addReviewAction()
    {
        $review = $this->_di->get('Review');

        $review->setProductId($_POST['review']['product_id']);
        $review->setCustomerId($_POST['review']['customer_id']);
        $review->setName($_POST['review']['name']);
        $review->setEmail($_POST['review']['email']);
        $review->setText($_POST['review']['text']);
        $review->setRating($_POST['review']['rating']);
        $review->save();
        $param = ['id' => $_POST['review']['product_id']];
        $this->_redirect('product_view', $param);
    }

        public function deleteReviewAction()
    {
        $product = $this->_di->get('Review');
        $product->load($_GET['review_id']);
        $product->remove();
        $param = ['id' => $_GET['id']];
        $this->_redirect('product_view', $param);
    }

}