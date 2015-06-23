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
  .when('/users/:id', {
    templateUrl: "show.html",
    controller: "UsersController",
    controllerAs: "usersCtrl"
  })
  .when('/meetups/:id', {
    templateUrl: "meetup.html",
    controller: "MeetupsController",
    controllerAs: "meetupsCtrl"
  })
  .when('/invitees/:id', {
    templateUrl: "invitee.html",
    controller: "InviteesController",
    controllerAs: "invtCtrl"
  })
  .otherwise({
    redirectTo: '/'
  });
}