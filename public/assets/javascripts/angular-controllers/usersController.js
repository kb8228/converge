angular.module('convergeApp')
  .controller('UsersController', UsersController);

  UsersController.$inject = ['$http','$routeParams', '$window'];

  function UsersController($http, $routeParams, $window){
    var self = this;
    var accessToken = window.sessionStorage.access_token;
    self.params = $routeParams;
    self.error;
    self.currentUser;
    self.location;

    self.createUser = function(){
    // name, etc. are being passed from the form
      var newUser = {user: {
        name:self.name,
        email: self.email,
        phoneNumber: self.phoneNumber,
        password: self.password,
        password_confirmation: self.password_confirmation
        }
      };

      $http.post("/api/users", newUser)
      .success(function(data){
        console.log('user was created');
        console.log(data);
        self.showUser(data);
      })
      .error(function(data){
        console.log(data);
        console.log(newUser);
        console.log('error');
        self.error = data.error;
      });
    }

    self.updateUserLocation = function(){
      var userLocation = {
        location: self.location,
        token: accessToken
      };
      var url = "/api/users/" + self.params.id;
      $http.patch(url, userLocation)
      .success(function(data){
        console.log('user location was created');
        console.log(data);
      })
      .error(function(data){
        console.log(data);
        console.log(userLocation);
        console.log('error');
        self.error = data.error;
      });
    }

    self.showUser = function(user){
      var url = "/api/users/" + user.id;
      console.log(self.params);
      console.log(url);
      $http.post(url, {token: user.token})
      .success(function(data){
        console.log('heres your user');
        self.currentUser = data;
        // $window.location.href = "#/users/" + currentUser.id;
      })
      .error(function(data){
        console.log(data);
        console.log('error');
        self.error = data.error;
      });
    }
  }