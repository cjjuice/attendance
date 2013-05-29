app.controller "GroupsCtrl", ($scope, $http, $location, $state, $stateParams) ->
 
  # =========================================================================
  # Initialize
  # =========================================================================

  $scope.groups = {}
  if $state.current.name == 'groups'
    $http.get("api/groups"

    # success
    ).then ((response) ->
      $scope.groups = response.data

    # failure
    ), (error) ->
	
  return false	