blogController.controller('layoutController', layoutController);

function layoutController($scope, layoutModel) {
    $scope.model = $scope.model || {};
    $scope.model.layout = layoutModel;
    var vm = $scope.model.layout;

    vm.menuItems.push({ name: 'HOME', url: '/#/home/' });
    vm.menuItems.push({ name: 'ABOUT', url: '/#/about/' });
    vm.menuItems.push({ name: 'PHOTOS', url: '/#/home/' });
    vm.menuItems.push({ name: 'ARCHIVES', url: '/#/home/' });
    vm.menuItems.push({ name: 'CONTACT', url: '/#/contact/' });

    vm.activeMenuItem = vm.menuItems[0].name;

    vm.setActive = function (menuItem) {
        vm.activeMenuItem = menuItem;
    };
};

layoutController.$inject = ['$scope', 'layoutModel'];