# Module
app = angular.module("Attendance", ["ngResource", "ng-rails-csrf"])

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
