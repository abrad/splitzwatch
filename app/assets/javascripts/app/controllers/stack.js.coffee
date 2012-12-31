#= require ./menu

class App.controllers.Stack extends Spine.Stack

  controllers:
    menu: App.controllers.Menu

  routes:
    '': 'menu'

