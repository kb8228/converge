// authenticationController.js
angular.module("convergeApp")
  .controller("AuthenticationController", AuthenticationController);

  AuthenticationController.$inject = ["$http"];

  function AuthenticationController($http){
    var self = this;

    self.email; //bound to form in view
    self.password; //bound to form in view
    self.login = login;
    self.logout = logout;
    self.setAccessToken = setAccessToken;
    self.isAuthenticated = isAuthenticated();

    function login(){
      var credentials = { 
        email: self.email, 
        password: self.password 
      };

      $http.post("/api/authenticate", credentials)
      .success(function(data){
          console.log(data);
          setAccessToken(data.token);
          self.isAuthenticated = isAuthenticated();
          self.email = null;
          self.password = null;
          window.location.href = ('#/users/' + data.id);
      })
      .error(function(data){
        console.log(data);
      });
    }
    
    function logout(){
      window.sessionStorage.clear();
      self.isAuthenticated = isAuthenticated();
      window.location.href = ('#/');
    }
            
    function setAccessToken(token){
      window.sessionStorage.setItem("access_token", token);
    }

    function isAuthenticated(){
        console.log(window.sessionStorage.access_token ? true : false);
        return window.sessionStorage.access_token ? true : false;
    }
  } // AuthenticationController ENDs

