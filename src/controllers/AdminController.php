<?php
namespace App\Controller;

use App\Model\Admin;
use App\Model\CustomerCollection;
use App\Model\Resource\DBCollection;
use App\Model\Resource\DBEntity;
//use App\Model\CustomerCollection;
use App\Model\Customer;
use App\Model\Resource\Table\Order;
use App\Model\Resource\Table\Review as ReviewTable;
use App\Model\ReviewCollection;
use App\Model\Resource\Table\Admin as AdminTable;
use App\Model\Session;

class AdminController
{
    private $_di;

    public function __construct(\Zend\Di\Di $di)
    {
        $this->_di = $di;
    }

    public function loginAction()
    {
        if (isset($_POST['admin'])) {
            $login = $this->_loginAdmin();
            if ($login) {
                $admin = $this->_di->get('Admin', ['data' => $login]);

                $session = $this->_di->get('Session');
                $session->loginAdmin($admin->getId());
                $session->setName($admin->getName());
                header("Location: /?page=product_list");
            } else {
                return $this->_di->get('View', [
                    'template' => 'admin_login'
                ]);
            }
        } else {
            return $this->_di->get('View', [
                'template' => 'admin_login'
            ]);
        }
    }

    public function logoutAction()
    {
        $session = $this->_di->get('Session');
        $session->logoutAdmin();
        header("Location: /?page=product_list");
    }

    public function registerAction()
    {
        if (isset($_POST['admin'])) {
            $this->_registerAdmin();
            header("Location: /?page=product_list");
        } else {
            return $this->_di->get('View', [
                'template' => 'admin_register'
            ]);
        }
    }

    public function OrdersAction()
    {
        $resourceOrder = $this->_di->get('ResourceCollection', ['table' => new Order]);
        $paginator = $this->_di->get('Paginator', ['collection' => $resourceOrder]);
        $orders = $this->_di->get('OrderCollection', ['collection' => $resourceOrder]);
        $id_sort = 0;
        $filterKey = isset($_POST['filter']['key']) ? $_POST['filter']['key'] : null;
        var_dump(count($orders->getOrders()));
        $filterValue = isset($_POST['filter']['value']) ? $_POST['filter']['value']  : null;
        $paginator
            ->setItemCountPerPage(1)
            ->setCurrentPageNumber(isset($_GET['p']) ? $_GET['p'] : 1);

        $pages = $paginator->getPages();
        var_dump(count($orders->getOrders()));
        if (isset($_POST['sort']))
        {
            foreach ($_POST['sort'] as $key => $value) {
                if ($value == 1) {
                    $orderBy = $key . ' DESC';
                    $id_sort = 1;

                }
                else {
                    $orderBy = $key . ' ASC';
                    $id_sort = 0;
                }
                $orders->sortOrders($orderBy);
            }
        }
        if ($filterKey != "" && $filterValue != "")
            $orders->filterLikeByOrder($filterKey,$filterValue);
        $order = [];
        foreach ($orders->getItems() as $item)
        {
            $order[] = [
                'order_id'      => $item->getId(),
                'number_order'  => $item->getNumber(),
                'created_at'    => $item->getDate(),
                'grand_total'   => $item->getGrandTotal(),
                'status'        => $item->getStatus()
            ];
        }



        return $this->_di->get('View', [
            'template'  => 'admin_orders',
            'params'    => [
                'id_sort'  => $id_sort,
                'orders'   => $order,
                'pages'    => $pages
            ]
        ]);
    }

    public function editOrderAction()
    {
        $order = $this->_di->get('Order');
        $OPCollection = $this->_di->get('OrderProductCollection');

        $order->load($_GET['id']);
        $OPCollection->filterByOrder($_GET['id']);

        return $this->_di->get('View', [
            'template' => 'admin_editOrder',
             'params' => [
                'orders' => $order,
                'OPCollection' => $OPCollection,
            ]
        ]);
    }

    private function _registerAdmin()
    {
        $_POST['admin']['password'] = md5($_POST['admin']['password']);
        $admin = $this->_di->get('Admin', ['data' => $_POST['admin']]);
        $admin->save();
    }

    private function _loginAdmin()
    {
        $resource = $this->_di->get('ResourceCollection', ['table' => new AdminTable]);
        $admins = $this->_di->get('AdminCollection', ['resource' => $resource]);
        $_POST['admin']['password'] = md5($_POST['admin']['password']);
        return $admins->getUser($_POST['admin']);
    }

}