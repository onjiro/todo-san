#= require angular.min
#= require angular-resource.min

angular.module('todo', ['ngResource']).factory 'Todo', ['$resource', ($resource) ->
  return $resource '/todos/:id.json',
    {
      id: '@id'
    },
    {
      'update': { method: 'PUT' }
    }
]
