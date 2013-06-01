app.controller "SessionsCtrl", ($scope, $http, $location, $state, $stateParams) ->
 
  # =========================================================================
  # Create
  # =========================================================================
 
  $scope.create = ->
    $http.post("/api/sessions",
      email: $scope.user.email
      password: $scope.user.password
 
       # success
        ).then ((response) ->
          $location.path "/groups"
 
       # failure
        ), (error) ->
	
  return false