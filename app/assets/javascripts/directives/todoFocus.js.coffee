#= require modules/todo

angular.module('todo').directive 'todoFocus', ($timeout) ->
  return (scope, elem, attrs) ->
    scope.$watch attrs.todoFocus, (editing) ->
      return unless editing
      $timeout (() -> elem[0].focus()), 0, false
