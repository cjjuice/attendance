# Configure 'app' routing. The $stateProvider and $urlRouterProvider
# will be automatically injected into the configurator.
app.config ($stateProvider, $urlRouterProvider) ->
 
  # Make sure that any other request beside one that is already defined
  # in stateProvider will be redirected to root.
  $urlRouterProvider
    .otherwise("/")
 
  # Define 'app' states
  $stateProvider
    .state "default",
      abstract: true
      views:
        "":
          controller: "ApplicationController"
          templateUrl: "default.html"
		
    # groups
    .state "groups",
      parent: "default"
      url: "/groups"
      views:
        "":
          controller: "GroupsController"
          templateUrl: "groups-index.html"

    .state "new",
      parent: "groups"
      url: "/new"
      views:
        "@default":
          controller: "GroupsController"
          templateUrl: "groups-new.html"

    .state "show",
      parent: "groups"
      url: "/:id/show"
      views:
        "@default":
          controller: "GroupsController"
          templateUrl: "groups-show.html"