"use strict";

var blogApp = angular.module("blogApp", ["blog.ctrl", "blog.services", "blog.model"]);

var blogController = angular.module("blog.ctrl", []);
blogController.controller('homeController', homeController);

function homeController($scope, homeModel) {
    $scope.model = $scope.model || {};
    $scope.model.home = homeModel;
    var vm = $scope.model.home;
    vm.postingCollection = [];

    function init() {
        for (var i = 0; i < 3; i++) {
            var arr = new Array();
            for (var j = 0; j< 3; j++) {
                var postObj = {
                    postId: 1 + i,
                    title: 'Exploring Angular 1.5: Lifecycle Hooks',
                    content: 'Angular 1.5 is finally out! This article discusses the new lifecycle hooks in Angular.',
                    avtar: '/images/download.png',
                    postedDate: new Date()
                }
                arr.push(postObj);
            }
            vm.postingCollection.push(arr);
        }
    }

    //Bootstrapper
    init();

}

homeController.$inject = ['$scope', 'homeModel'];
blogController.controller('layoutController', layoutController);

function layoutController($scope, layoutModel) {
    $scope.model = $scope.model || {};
    $scope.model.layout = layoutModel;
    var vm = $scope.model.layout;
    vm.headingCaption = 'Welcome to Arun Blog';

    vm.menuItems.push({ name: 'HOME', url: '/index/home/' });
    vm.menuItems.push({ name: 'ABOUT', url: '/index/home/' });
    vm.menuItems.push({ name: 'PHOTOS', url: '/index/home/' });
    vm.menuItems.push({ name: 'ARCHIVES', url: '/index/home/' });
    vm.menuItems.push({ name: 'CONTACT', url: '/index/home/' });

    vm.activeMenuItem = vm.menuItems[0].name;

    vm.setActive = function (menuItem) {
        vm.activeMenuItem = menuItem;
    };
};

layoutController.$inject = ['$scope', 'layoutModel'];
var blogService = angular.module("blog.services", []);

var blogModel = angular.module("blog.model", []);
blogModel.factory('homeModel', function () {
    return {
        postId: 0,
        title: '',
        content: '',
        tag: '',
        avtarImg: '',
        postedDate: new Date(),
        userId: 0
    };
});
blogModel.factory('layoutModel', function () {
    return {
        headingCaption: 'Welcome to Arun Blog',
        menuItems: [],
        activeMenuItem: ''
    };
});