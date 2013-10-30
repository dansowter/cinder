Cinder.EditTodoView = Ember.TextField.extend
  classNames: ['edit']

  valueBinding: 'todo.title'

  change: ->
    value = @get('value')

    if (Ember.isEmpty(value))
      @get('controller').removeTodo()

  focusOut: ->
    @set('controller.isEditing', false)

  insertNewline: ->
    @set('controller.isEditing', false)

  didInsertElement: ->
    @$().focus()
