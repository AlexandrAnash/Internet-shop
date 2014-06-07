shopApp.controller('productListController', function ($scope) {
    $scope.allProducts =  [];
    $scope.loadProducts = function (id, name, image, sku, price, desc, qty, type, spec) {
        console.log("type",type);
        typeShow = '';
        if (type == 'phone')
            typeShow = 'Мобильный телефон';
        if (type == 'Photo')
            typeShow = 'Фотоаппарат';
        if (type == 'Notepad')
            typeShow = 'Планшет';
        if (type == 'Notebook')
            typeShow = 'Ноутбук';
        if (type == 'TV')
            typeShow = 'Телевизор';
        if (type == 'Complect')
            typeShow = 'Комплектующие к ПК';
        if (type == 'Aksess')
            typeShow = 'Аксессуары';

        $scope.allProducts.push({
            id           : id,
            name         : name,
            image        : image,
            sku          : sku,
            price        : price,
            description  : desc,
            qty          : qty,
            type         : type,
            specialPrice : spec || '',
            typeShow     : typeShow
        });
        $scope.sortProduct = $scope.allProducts;
        $scope.loadPaginate($scope.sortProduct);

    }

    $scope.filterSortType = function(type) {
        $scope.sortProduct = [];
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