Race = App.models.Race

class Index extends Spine.Controller
  elements:
    '#races-list': 'racesList'

  constructor: ->
    super
    @active @render

  render: ->
    @html @view('races/index')()
    @_showAll()

  _showAll: ->
    @racesList.html @view('races/_all_table')(
      races: Race.allByDate()
    )


class App.controllers.Races extends Spine.Stack

  controllers:
    index: Index

  routes:
    '': 'index'

