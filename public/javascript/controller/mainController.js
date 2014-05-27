var shopApp = angular.module('shopApp', []);
shopApp.controller('mainController', function ($scope) {
    $scope.pageSize = 6;
    $scope.currentPage = 1;
    $scope.numPerPage = 5;

    $scope.loadPaginate = function (Array) {
        $scope.pages = Math.ceil(Array.length/6);
    }


});