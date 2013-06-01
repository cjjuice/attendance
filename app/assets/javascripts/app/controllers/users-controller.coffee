app.controller "UsersCtrl", ($scope, $http, $location, $state, $stateParams) ->
 
  # =========================================================================
  # Create
  # =========================================================================
 
  $scope.create = ->
    $http.post("/api/users",
      user:
        email: $scope.user.email
        password: $scope.user.password
        password_confirmation: $scope.user.password_confirmation
 
       # success
        ).then ((response) ->
          $location.path "/users"
 
       # failure
        ), (error) ->
	
  return false
