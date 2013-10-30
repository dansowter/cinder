Cinder.Router.map ()->
  @resource 'todos', path: '/', ->
    @route 'active'
    @route 'completed'

Cinder.TodosRoute = Ember.Route.extend
  model: ->
    Cinder.Todo.find()

Cinder.TodosIndexRoute = Ember.Route.extend
  setupController: ->
    todos = Cinder.Todo.find()
    @controllerFor('todos').set('filteredTodos', todos)

Cinder.TodosActiveRoute = Ember.Route.extend
  setupController: ->
    todos = Cinder.Todo.filter (todo) ->
      true if (!todo.get('isCompleted'))
    @controllerFor('todos').set('filteredTodos', todos)

Cinder.TodosCompletedRoute = Ember.Route.extend
  setupController: ->
    todos = Cinder.Todo.filter (todo) ->
      true if todo.get('isCompleted')
    @controllerFor('todos').set('filteredTodos', todos)
