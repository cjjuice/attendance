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
          templateUrl: "/assets/layouts/default.html.erb"

    # home
    .state "home",
      parent: "default"
      url: "/"
      views:
        "":
          controller: "HomeCtrl"
          templateUrl: "/assets/home.html.erb"    
          
    # groups
    .state "groups",
      parent: "default"
      url: "/groups"
      views:
        "":
          controller: "GroupsCtrl"
          templateUrl: "/assets/groups.html.erb"
    
    .state "show",
      parent: "groups"
      url: "/:id"
      views:
        "@default":
          controller: "GroupsCtrl"
          templateUrl: "/assets/show-groups.html.erb"
      
          
          
