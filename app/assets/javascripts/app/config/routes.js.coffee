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

    #signup
    .state "signup",
      parent: "default"
      url: "/signup"
      views:
        "":
          controller: "UsersCtrl"
          templateUrl: "/assets/users/new.html.erb"
          
    #sessions
    .state "login",
      parent: "default"
      url: "/login"
      views:
        "":
          controller: "SessionsCtrl"
          templateUrl: "/assets/sessions/new.html.erb"      
          
    # groups
    .state "groups",
      parent: "default"
      url: "/groups"
      views:
        "":
          controller: "GroupsCtrl"
          templateUrl: "/assets/groups/index.html.erb"

    .state "groupsNew",
      parent: "groups"
      url: "/new"
      views:
        "@default":
          controller: "GroupsCtrl"
          templateUrl: "/assets/groups/new.html.erb"

    .state "show",
      parent: "groups"
      url: "/:id/show"
      views:
        "@default":
          controller: "GroupsCtrl"
          templateUrl: "/assets/groups/show.html.erb"
          
