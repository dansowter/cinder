class TodosController < ApplicationController
  def index
    render json: Todo.all
  end

  def show
    render json: todo
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      render json: @todo, status: :created, location: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  def update
    if todo.update(todo_params)
      head :no_content
    else
      render json: todo.errors, status: :unprocessable_entity
    end
  end

  def destroy
    todo.destroy
    head :no_content
  end

  private
  def todo
    Todo.find params[:id]
  end

  def todo_params
    params.require(:todo).permit(:is_completed, :title)
  end
end
