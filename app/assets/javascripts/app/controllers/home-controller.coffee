app.controller "HomeCtrl", ($scope, $http, $location, $state, $stateParams) ->
 
  # =========================================================================
  # Log In
  # =========================================================================
 
  $scope.createSession = ->
    $http.post("/api/sessions",
      email: $scope.session.email
      password: $scope.session.password
 
       # success
        ).then ((response) ->
          $location.path "/groups"
 
       # failure
        ), (error) ->
          
  # =========================================================================
  # Sign up
  # =========================================================================        
          
  $scope.createUser = ->
    $http.post("/api/users",
      user:
        email: $scope.user.email
        password: $scope.user.password
        password_confirmation: $scope.user.password_confirmation

       # success
        ).then ((response) ->
          $location.path "/groups"

       # failure
        ), (error) ->
          
  return false