Cinder.Todo = DS.Model.extend
  title: DS.attr('string')
  isCompleted: DS.attr('boolean')

  todoDidChange: (->
    Ember.run.once @, ->
      @get('store').commit()
  ).observes('isCompleted', 'title')
