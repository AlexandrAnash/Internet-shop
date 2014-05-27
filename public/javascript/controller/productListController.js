shopApp.controller('productListController', function ($scope) {
    $scope.allProducts =  [];
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
        $scope.loadPaginate($scope.sortProduct);

    }

    $scope.filterSortType = function(type) {
        $scope.sortProduct = [];
        console.log("type",type);
        for (i =0; i < $scope.allProducts.length; i++) {
            if ($scope.allProducts[i].type == type) {
                $scope.sortProduct.push($scope.allProducts[i]);
            }
        }
        $scope.currentPage = 1;
        $scope.loadPaginate($scope.sortProduct);
    }

    $scope.editPage = function(page) {
        $scope.currentPage = page;
    }


});