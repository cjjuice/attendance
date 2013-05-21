app = angular.module("Attendance", ["ngResource"])

app.factory "Groups", ["$resource", ($resource) ->
  $resource("/groups/:id", {id: "@id"}, {update: {method: "PUT"}})
]
