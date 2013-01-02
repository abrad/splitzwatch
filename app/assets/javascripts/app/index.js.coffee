#= require json2
#= require jquery
#= require spine
#= require spine/manager
#= require spine/ajax
#= require spine/route

#= require_tree ./lib
#= require_self
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views

class App extends Spine.Controller
  constructor: ->
    super
    @stack = new App.controllers.Races
    @append @stack
    @stack.index.active()
    Spine.Route.setup()

App.models = {}
App.controllers = {}
window.App = App
