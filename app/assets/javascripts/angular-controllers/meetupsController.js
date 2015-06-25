angular.module('convergeApp')
  .controller('MeetupsController', MeetupsController);

  MeetupsController.$inject = ['$http','$routeParams', '$window'];

  function MeetupsController($http, $routeParams, $window){
    var self = this;
    self.date;
    self.time;
    self.meetups;
    self.params = $routeParams;
    //self.setCurrentMeetup;
    self.currentMeetup;
    self.currentMeetupId;
    self.error;
    self.location;

    ////////////MAP///////////////////////////

    self.getLocation = function(locId){
      var url = "/api/locations/" + locId;

      $http.get(url)
      .success(function(data){
        console.log('here is the meetup location');
        self.location = data;
        console.log(data);
      })
      .error(function(data){
        console.log(data);
        console.log('error');
        self.error = data.error;
      });
    }
    
    self.showConvergence = function() {
      var myLatlng = new google.maps.LatLng(self.location.latitude, self.location.longitude);
      var mapOptions = {
        zoom: 12,
        center: myLatlng
      };

      var map = new google.maps.Map(document.getElementById('googleMap'),
          mapOptions);

      var marker = new google.maps.Marker({
          position: myLatlng,
          map: map,
          title: 'Convergence Point!'
      });
    }
    google.maps.event.addDomListener(window, 'load', self.showConvergence);

    ////////////////////////////////////////////////////

    self.setCurrentMeetup = function(mtp){
      self.currentMeetup = mtp;
      self.currentMeetupId = mtp.id;
      $window.location.href = "#/meetups/" + self.currentMeetupId;
    }

    self.createMeetup = function(){
      var user = $window.location.hash.replace("#/users/", "");
      var newMeetup = {
        date:self.date,
        time: self.time,
        user_id: user
      };

      $http.post("/api/meetups", newMeetup)
      .success(function(data){
        self.date = null;
        self.time = null;
        console.log('meetup was created');
        self.setCurrentMeetup(data);
        self.currentMeetupId = data.id;
        $window.location.href = "#/meetups/" + self.currentMeetupId;
      })
      .error(function(data){
        console.log(data);
        console.log(newMeetup);
        console.log('error');
        self.error = data.error;
      });
    }

    self.meetupsIndex = function(){
      var url = "/api/meetups?user_id=" + self.params.id;
      console.log(self.params);

      $http.get(url)
      .success(function(data){
        console.log('here are your meetups');
        self.meetups = data;
      })
      .error(function(data){
        console.log(data);
        console.log('error');
        self.error = data.error;
      });
    }

    self.showMeetup = function(){
      var url = "/api/meetups/" + self.params.id;
      console.log(url);
      $http.get(url)
      .success(function(data){
        self.setCurrentMeetup(data);
        console.log('heres your meetup');
      })
      .error(function(data){
        console.log(data);
        console.log('error');
        self.error = data.error;
      });
    }

    self.goBack = function(){
      $window.history.back();
    }
  }