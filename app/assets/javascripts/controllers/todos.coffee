Cinder.TodosController = Ember.ArrayController.extend
  createTodo: ->
    title = @get('newTitle')
    return if !title.trim()

    Cinder.Todo.createRecord
      title: title
      isCompleted: false

    @set('newTitle', '')
    @get('store').commit()

  clearCompleted: ->
    completed = @filterProperty('isCompleted', true)
    completed.invoke('deleteRecord')
    @get('store').commit()

  remaining: (->
    @filterProperty('isCompleted', false).get('length')
  ).property('@each.isCompleted')

  remainingFormatted: (->
    remaining = @get('remaining')
    console.log remaining
    plural = if remaining is 1
      'item'
    else
      'items'
    '<strong>%@</strong> %@ left'.fmt(remaining, plural)
  ).property('remaining')

  completed: (->
    @filterProperty('isCompleted', true).get('length')
  ).property('@each.isCompleted')

  hasCompleted: (->
    @get('completed') > 0
  ).property('completed')

  allAreDone: ((key, value) ->
    if (value isnt undefined)
      @setEach('isCompleted', value)
    else
      return !!@get('length') && @everyProperty('isCompleted', true)
  ).property('@each.isCompleted')
