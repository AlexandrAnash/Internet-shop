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
    $scope.editPage = function(page) {
        $scope.currentPage = page;
    }


});