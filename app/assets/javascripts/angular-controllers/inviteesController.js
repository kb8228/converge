// create/show/update/destroy invitee actions here w/ send link to invitee.email on create
// auth by email??? - via Rails controller?

angular.module('convergeApp')
  .controller('InviteesController', InviteesController);

  InviteesController.$inject = ['$http','$routeParams', '$window'];

  function InviteesController($http, $routeParams, $window){
    var self = this;
    self.params = $routeParams;
    self.error;
    self.invitees;
    self.currentInvitee;
    self.name;
    self.phone_number;

    self.createInvitee = function(){
      var meetupId = window.location.hash.replace("#/meetups/", "");
      meetupId = parseInt(meetupId, 10);
      console.log(meetupId);
      var newInvitee = {
        name: self.name,
        phone_number: self.phone_number,
        meetup_id: meetupId
      };

      $http.post("/api/invitees", newInvitee)
      .success(function(data){
        console.log('invitee was created');
        console.log(data);
      })
      .error(function(data){
        console.log(data);
        console.log('error');
        self.error = data.error;
      });
    } // createInvitee ENDs

    self.inviteesIndex = function(){
      var meetupId = window.location.hash.replace("#/meetups/", "");
      console.log(meetupId);
      var url = "/api/invitees?meetup_id=" + meetupId;
      console.log(self.params);

      $http.get(url)
      .success(function(data){
        console.log('here are your invitees');
        console.log(data); // logs empty array
        self.invitees = data;
      })
      .error(function(data){
        console.log(data);
        console.log('error');
        self.error = data.error;
      });
    }

    self.showInvitee = function(){
      var url = "/api/invitees/" + self.params.id;
      console.log(self.params);
      console.log(url);
      $http.get(url)
      .success(function(data){
        console.log('heres your invitee');
        self.currentInvitee = data;
        window.location.href = "#/invitees/" + data.id;
      })
      .error(function(data){
        console.log(data);
        console.log('error');
        self.error = data.error;
      });
    } // showInvitee ENDs

  } // InviteesController ENDs