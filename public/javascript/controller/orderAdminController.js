shopApp.controller('orderAdminController', function ($scope) {
    $scope.allOrders =  [];

    $scope.loadOrders = function (number, date, grandTotal, status, id) {
        $scope.allOrders.push({
            number      : number,
            date        : date,
            grandTotal  : grandTotal,
            status      : status,
            id          : id
        });
        $scope.loadPaginate($scope.allOrders);
    }
    $scope.enterFilterOrder = function (array) {
        $scope.loadPaginate(array);
        $scope.currentPage = 1;
        console.log("sss",array);
    }
    $scope.editPage = function(page) {
        $scope.currentPage = page;
        console.log("edit", $scope);
    }


});