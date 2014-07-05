#= require support/angular-mocks
#= require models/todo

describe "Todo", ->
  beforeEach module('todo')

  it "should have no id after creation", inject (Todo) ->
    expect(new Todo().id).to.be undefined
