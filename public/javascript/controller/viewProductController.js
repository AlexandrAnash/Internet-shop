shopApp.controller('viewProductController', function ($scope) {
    $scope.allReviews =  [];

    $scope.loadReviews = function (id, rating, name, email, text) {
        $scope.allReviews.push({
            id           : id,
            rating       : rating,
            name         : name,
            email        : email,
            text         : text
        });
        $scope.loadPaginate($scope.allReviews);
        console.log("",document.cookie);
    }

    $scope.loadType = function ( type ) {
        if (type == 'phone')
            $scope.typeShow = 'Мобильный телефон';
        if (type == 'Photo')
            $scope.typeShow = 'Фотоаппарат';
        if (type == 'Notepad')
            $scope.typeShow = 'Планшет';
        if (type == 'Notebook')
            $scope.typeShow = 'Ноутбук';
        if (type == 'TV')
            $scope.typeShow = 'Телевизор';
        if (type == 'Complect')
            $scope.typeShow = 'Комплектующие к ПК';
        if (type == 'Aksess')
            $scope.typeShow = 'Аксессуары';
    }
    $scope.editPage = function(page) {
        $scope.currentPage = page;
    }


});