Cinder.EditTodoView = Ember.TextField.extend
  classNames: ['edit']

  valueBinding: 'todo.title'

  change: ->
    value = @get('value')

    if (Ember.isEmpty(value))
      @get('targetObject').removeTodo()

  focusOut: ->
    @set('targetObject.isEditing', false)

  insertNewline: ->
    @set('targetObject.isEditing', false)

  didInsertElement: ->
    @$().focus()
