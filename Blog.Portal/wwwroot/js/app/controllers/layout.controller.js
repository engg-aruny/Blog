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