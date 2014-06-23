app.controller 'todoCtrl', ['$scope', '$http', ($scope, $http) ->
  $scope.todos = []
  $http.get('/todos.json')
    .success (data, status, headers, config) ->
      $scope.todos = data
    .error (data, status, headers, config) ->
      console.log(err)
]
