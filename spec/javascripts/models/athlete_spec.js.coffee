Athlete = App.models.Athlete

describe "Athlete model", ->

  beforeEach ->
    Athlete.deleteAll()
    @validAttributes =
      first_name: Chris
      last_name: Wong
      age: 13

  it "should be createable", ->
    a = Athlete.create @validAttributes
    expect(a.first_name).toBe @validAttributes.first_name
    expect(a.last_name).toBe @validAttributes.last_name
    expect(a.age).toBe @validAttributes.age
