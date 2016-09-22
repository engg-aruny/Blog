blogApp.config(function ($routeProvider) {
    $routeProvider
    .when('/', {
        templateUrl: '/home/post'
    })
    .when('/home', {
        templateUrl: '/home/post'
    })
    .when('/about', {
        templateUrl: '/home/about'
    })
    .when('/contact', {
        templateUrl: '/home/contact'
    })
    .otherwise('/', {
        templateUrl: 'home/post'
    })
});