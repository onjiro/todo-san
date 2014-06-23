app.controller 'todoCtrl', ['$scope', '$http', ($scope, $http) ->
  $scope.loading = true
  $scope.todos = []
  $http.get('/todos.json')
    .success (data, status, headers, config) ->
      $scope.todos = data
      $scope.loading = false
    .error (data, status, headers, config) ->
      console.log(err)
]
