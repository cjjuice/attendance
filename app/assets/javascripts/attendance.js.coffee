# Module
app = angular.module("Attendance", ["ngResource", "templates", "ng-rails-csrf"])

# Routes
app.config ['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider)->
  $locationProvider.html5Mode(true)

  $routeProvider
    .when '/', templateUrl: "/assets/templates/index.html.haml"
]

# Resource factories
app.factory "Groups", ["$resource", ($resource) ->
  $resource("/groups/:id", {id: "@id"}, {update: {method: "PUT"}})
]

app.factory "Users", ["$resource", ($resource) ->
  $resource("/users/:id", {id: "@id"}, {update: {method: "PUT"}})
]

app.factory "Attendees", ["$resource", ($resource) ->
  $resource("/attendees/:id", {id: "@id"}, {update: {method: "PUT"}})
]

#Controllers
@GroupCtrl = ["$scope", "Group", ($scope, Group) ->

]
