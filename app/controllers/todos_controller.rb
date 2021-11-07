class TodosController < ApplicationController
  def index
    @todos = Todo.all
    @todo = Todo.new
  end

  def create
    @todo = Todo.create(todo_params)

    @todo.save

    redirect_to action: 'index'
  end

  def update
    @todo = Todo.find(params[:id])

    @todo.status = params[:status]

    @todo.save

    redirect_to action: 'index'
  end

  private

  def todo_params
    params.require(:todo).permit(:todo, :status)
  end
end
