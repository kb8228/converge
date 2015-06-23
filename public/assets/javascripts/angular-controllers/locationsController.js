angular.module('convergeApp')
  .controller('LocationsController', LocationsController);

  LocationsController.$inject = ['$http','$routeParams', '$window'];

  function LocationsController($http, $routeParams, $window){
    var self = this;
    self.params = $routeParams;
    self.address;
    self.error;

    // self.createLocation = function(){
    //   var url = window.location.hash;
    //   var newLocation = {}

    //   if(url.indexOf("users") != -1){
    //     // newLocation.user_id = url.replace("#/users/", "");
    //     newLocation.address = self.address;
    //   }
    //   else if(url.indexOf("invitees") != -1){
    //     // newLocation.invitee_id = url.replace("#/invitees/", "");
    //     newLocation.address = self.address;
    //   }

    //   $http.post("/api/locations", newLocation)
    //   .success(function(data){
    //     console.log(data);
    //     console.log('location was created');
    //     self.address = null;
    //   })
    //   .error(function(data){
    //     console.log(data);
    //     console.log(newLocation);
    //     console.log('error');
    //     self.error = data.error;
    //   });
    // }

    self.showLocation = function(){
      var url = "/api/locations/" + self.params.id;
      console.log(self.params);
      console.log(url);
      $http.get(url)
      .success(function(data){
        console.log('heres your location');
        console.log(data);
      })
      .error(function(data){
        console.log(data);
        console.log('error');
        self.error = data.error;
      });
    }
  }