Race = App.models.Race
Athlete = App.models.Athlete

describe "Race model", ->

  beforeEach ->
    Race.deleteAll()
    Athlete.deleteAll()
    @ath1 = Athlete.create(
      first_name: Chris
      last_name: Wong
      age: 15
    )
    @ath2 = Athlete.create(
      first_name: David
      last_name: Rudisha
      age: 28
    )
    @validAttributes =
      name: "2013 World Champs 10000m"
      date: new Date()
      athlete_ids: [@ath1.id, @ath2.id]
      num_laps: 2

  it "should be createable", ->
    r = Race.create @validAttributes
    expect(r.name).toBe @validAttributes.name
    expect(r.date).toBe @validAttributes.date
    expect(r.num_laps).toBe @validAttributes.num_laps
 
  # a race page should be able to show information about athletes (name at least)
  it "should be able to retrieve the relevant Athlete models", ->
    r = Race.create @validAttributes
    athletes = r.getAthletes()
    expect(athletes.length).toBe 2
    expect(athletes.indexOf(@ath1) > 0).toBeTruthy()
    expect(athletes.indexOf(@ath2) > 0).toBeTruthy()

  it "should store the lap splits for each athlete and offer finishing time", ->
    # splits
    s1a = 50.18
    s2a = 61.22
    s1b = 108.27
    s2b = 151.38

    r = Race.create @validAttributes
    r.split @ath1.id, s1a
    r.split @ath2.id, s2a

    # finish times don't exist yet
    expect(r.getFinishTime @ath1.id).toBeFalsy()
    expect(r.getFinishTime @ath2.id).toBe s2b

    r.split @ath1.id, s1b
    r.split @ath2.id, s2b

    expect(r.getFinishTime @ath1.id).toBe s1b
    expect(r.getFinishTime @ath2.id).toBe s2b

    a1Splits = r.getSplits @ath1.id
    expect(a1Splits.length).toBe 2
    expect(a1Splits[0]).toBe s1a
    expect(a1Splits[1]).toBe s1b

