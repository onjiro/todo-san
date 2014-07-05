#= require modules/todo

angular.module('todo').factory 'Todo', ['$resource', ($resource) ->
  return $resource '/todos/:id.json',
    {
      id: '@id'
    },
    {
      'update': { method: 'PUT' }
    }
]
