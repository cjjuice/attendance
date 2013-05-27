app.controller "GroupsController", ($scope, $http, $location, $state, $stateParams) ->
 
  # =========================================================================
  # Initialize
  # =========================================================================

  $scope.lists = {}
  if $state.current.name == 'groups'
    $http.get("api/groups"

    # success
    ).then ((response) ->
      $scope.groups = response.data

    # failure
    ), (error) ->