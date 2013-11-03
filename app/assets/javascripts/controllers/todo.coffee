Cinder.TodoController = Ember.ObjectController.extend
  isEditing: false

  actions:
    editTodo: ->
      this.set('isEditing', true)

    removeTodo: ->
      todo = this.get('model')
      todo.deleteRecord()
      todo.get('store').commit()
