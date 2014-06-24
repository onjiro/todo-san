app.controller 'todoCtrl', ['$scope', '$http', ($scope, $http) ->
  $scope.loading = true
  $scope.todos = []
  $http.get('/todos.json')
    .success (data, status, headers, config) ->
      $scope.todos = data
      $scope.loading = false
    .error (data, status, headers, config) ->
      console.log(data)

  $scope.newTodo = ($event) ->
    $event.preventDefault()
    $scope.todos.push({ editing: true })

  $scope.editTodo = ($event, todo) ->
    $event.preventDefault()
    todo.editing = true

  $scope.doneEditTodo = ($event, todo) ->
    $event.preventDefault()
    delete todo.editing
    if todo.id
      $http.put("/todos/#{todo.id}.json", { todo: todo })
        .success (data, status, headers, config) ->
          todo.id = data.id
        .error (data, status, headers, config) ->
          console.log(data)
    else
      $http.post('/todos.json', { todo: todo })
        .success (data, status, headers, config) ->
          todo.id = data.id
        .error (data, status, headers, config) ->
          console.log(data)

  $scope.removeTodo = ($event, todo) ->
    $event.preventDefault()
    return if !confirm('削除してよろしいですか？')
    $http.delete("/todos/#{todo.id}.json")
      .success (data, status, headers, config) ->
        $scope.todos.splice $scope.todos.indexOf(todo), 1
      .error (data, status, headers, config) ->
        console.log('error', data)
]
