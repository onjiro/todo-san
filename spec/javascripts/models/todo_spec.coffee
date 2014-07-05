#= require support/angular-mocks
#= require models/todo

describe "Todo", ->
  beforeEach module('todo')

  it "should have no id after creation", inject (Todo) ->
    expect(new Todo().id).to.be undefined

  it "should have query method", inject (Todo) ->
    expect(Todo.query).to.be.a 'function'

  it "should have $save method", inject (Todo) ->
    expect(new Todo().$save).to.be.a 'function'

  it "should have $remove method", inject (Todo) ->
    expect(new Todo().$remove).to.be.a 'function'

  it "should have $update method", inject (Todo) ->
    expect(new Todo().$update).to.be.a 'function'
