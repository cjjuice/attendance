app.controller "GroupsCtrl", ($scope, $http, $location, $state, $stateParams) ->
 
  # =========================================================================
  # Initialize
  # =========================================================================

  $scope.groups = []
  if $state.current.name == 'groups'
    $http.get("api/groups"

    # success
    ).then ((response) ->
      $scope.groups = response.data

    # failure
    ), (error) ->
 
  # =========================================================================
  # Show
  # =========================================================================
 
  $scope.presentAttendees = []
  $scope.missingAttendees = []
  if $state.current.name == 'show'
    $http.get("/api/groups/#{$stateParams['id']}/attendees"
 
    # success
    ).then ((response) ->
      $scope.presentAttendees = (attendee for attendee in response.data when attendee.here)
      $scope.missingAttendees = (attendee for attendee in response.data when attendee.here is false)
      
      $http.get("/api/groups/#{$stateParams['id']}"
      
      # success
      ).then ((response) ->
        $scope.group = response.data
        
      #failure  
      ), (error) ->  
        
    # failure
    ), (error) ->	
    
 # =========================================================================
 # Add Attendee
 # =========================================================================
   $scope.addAttendee = ->
     $http.post("/api/attendees",
       name: $scope.newAttendee.name
       group_id: $scope.group.id

       # success
         ).then ((response) ->
           $scope.missingAttendees.push(response.data)
           $scope.newAttendee = {}

        # failure
         ), (error) ->
         
  # =========================================================================
  # Checkin Attendee
  # =========================================================================
   $scope.checkinAttendee = ->
     $http.post("/api/checkin?name=#{$scope.attendee}",
       group_id: $scope.group.id
       
        # success
         ).then ((response) ->
           # remove object from missingAttendees
           $scope.missingAttendees = _($scope.missingAttendees).reject((el) ->
             el.id is response.data.id
           )
           # add object to presentAttendees
           $scope.presentAttendees.push(response.data)
           $scope.attendee = ""

        # failure
         ), (error) ->     
  
  # =========================================================================
  # Reset List
  # =========================================================================
   $scope.resetAttendees = ->
     $http.get("/api/reset?group_id=#{$scope.group.id}"
       
      # success
     ).then ((response) ->
       # Add all objects to missingAttendees
       $scope.missingAttendees = $scope.missingAttendees.concat($scope.presentAttendees) 
       # empty presentAttendees
       $scope.presentAttendees = []

     # failure
     ), (error) -> 
      
 return false  
