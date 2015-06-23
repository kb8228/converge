// app.js
angular.module('convergeApp',['templates','ngRoute','validation.match'])
  .config(['$httpProvider', function($httpProvider) {
    $httpProvider.defaults.headers.patch = {
        'Content-Type': 'application/json;charset=utf-8'
    }
}]);