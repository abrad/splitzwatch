class App.controllers.Menu extends Spine.Controller

  constructor: ->
    super

    # for when we show updated status on menu
    @active @render()

  render: ->
    @html @view('menu')()
