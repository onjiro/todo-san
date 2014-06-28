app.controller 'todoCtrl', ['$scope', '$http', 'Todo', ($scope, $http, Todo) ->
  $scope.loading = true
  $scope.newtodo = new Todo()

  $scope.todos = Todo.query () ->
    $scope.loading = false

  $scope.saveNewTodo = ($event, todo) ->
    $event.preventDefault()
    return unless todo.content
    delete todo.editing
    todo.$save () ->
      $scope.todos.push(todo)
      $scope.newtodo = new Todo()

  $scope.editTodo = ($event, todo) ->
    $event.preventDefault()
    todo.editing = true

  $scope.doneEditTodo = ($event, todo) ->
    $event.preventDefault() if $event?.preventDefault
    return unless todo.content
    delete todo.editing
    todo.$update()

  $scope.removeTodo = ($event, todo) ->
    $event.preventDefault()
    return if !confirm('削除してよろしいですか？')
    todo.$remove () ->
      $scope.todos.splice $scope.todos.indexOf(todo), 1
]
