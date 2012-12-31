Athlete = App.models.Athlete

class App.models.Race extends Spine.Model
  @configure 'Race', 'name', 'date', 'num_laps', 'athlete_ids'

  constructor: (params) ->
    super params
    @athleteSplits = {}
    for athId in @athlete_ids
      @athleteSplits[athId] = []

  getAthletes: ->
    athletes = []
    for athId in @athlete_ids
      athletes.push Athlete.find athId

  split: (athId, time) ->
    @athleteSplits[athId].push time

  getSplits: (athId) ->
    @athleteSplits[athId]

  getFinishTime: (athId) ->
    splits = @getSplits athId
    splits[num_laps - 1]
