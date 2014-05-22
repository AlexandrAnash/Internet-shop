shopApp.controller('productListController', function ($scope) {
    $scope.allProducts =  [];
    $scope.pageSize = 6;
    $scope.currentPage = 1;
    $scope.numPerPage = 5;
    $scope.loadProducts = function (id, name, image, sku, price, desc, qty, type, spec) {
        $scope.allProducts.push({
            id           : id,
            name         : name,
            image        : image,
            sku          : sku,
            price        : price,
            description  : desc,
            qty          : qty,
            type         : type,
            specialPrice : spec || ''
        });
        $scope.sortProduct = $scope.allProducts;
        console.log("Header", $scope.allProducts);
    }

    $scope.loadPaginate = function () {
        $scope.pages = Math.floor($scope.sortProduct.length/6);
    }

    $scope.filterSortType = function(type) {
        $scope.sortProduct = [];
        console.log("type",type);
        for (i =0; i < $scope.allProducts.length; i++) {
            console.log("true",1111);
            if ($scope.allProducts[i].type == type) {
                $scope.sortProduct.push($scope.allProducts[i]);
            }
        }
        console.log("$scope.sortProduct",$scope.sortProduct);
        $scope.currentPage = 1;
        $scope.loadPaginate();
    }

    $scope.editPage = function(page) {
        $scope.currentPage = page;
    }


});