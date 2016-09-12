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