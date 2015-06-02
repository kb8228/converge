angular.module('convergeApp')
  .controller('UsersController', UsersController);

  UsersController.$inject = ['$http','$routeParams', '$window'];

  function UsersController($http, $routeParams, $window){
    var self = this;
    var accessToken = window.sessionStorage.access_token;
    self.params = $routeParams;
    self.error;
    self.users = "Users!";

    self.createUser = function(){
    // name, etc. are being passed on the form
      var newUser = {
        name:self.name,
        email: self.email,
        phoneNumber: self.phoneNumber,
        password: self.password,
        password_confirmation: self.password_confirmation
      };

      $http.post("/api/users", newUser)
      .success(function(data){
        console.log('user was created');
        console.log(data);
        $window.location.href = ('#/users/' + data.id);
      })
      .error(function(data){
        console.log(data);
        console.log('error');
        self.error = data.error;
      });
    }

    self.showUser = function(){
      var url = "/api/users/" + self.params.id;
      console.log(self.params);
      console.log(url);
      $http.get(url)
      .success(function(data){
        console.log('heres your user');
        self.currentUser = data;
      })
      .error(function(data){
        console.log(data);
        console.log('error');
        self.error = data.error;
      });
    }
  }