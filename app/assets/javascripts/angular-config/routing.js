// routing.js

angular.module('convergeApp')
  .config(['$routeProvider', config]);

function config($routeProvider){
  $routeProvider
  .when('/',{
    templateUrl: "index.html",
    controller: "UsersController",
    controllerAs: "usersCtrl"
    })
  .otherwise({
    redirectTo: '/'
  });
}