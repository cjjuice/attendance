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
		
    # Lists
    .state "lists",
      parent: "default"
      url: "/lists"
      views:
        "":
          controller: "ListsController"
          templateUrl: "lists-index.html"

    .state "new",
      parent: "lists"
      url: "/new"
      views:
        "@default":
          controller: "ListsController"
          templateUrl: "lists-new.html"

    .state "show",
      parent: "lists"
      url: "/:id/show"
      views:
        "@default":
          controller: "ListsController"
          templateUrl: "lists-show.html"