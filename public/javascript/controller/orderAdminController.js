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
        console.log("Orders", $scope.allOrders);
    }
    $scope.editPage = function(page) {
        $scope.currentPage = page;
    }


});