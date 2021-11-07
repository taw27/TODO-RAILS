class TodosController < ApplicationController
  def index
    @todos = Todo.order(status: :desc)
    @todo = Todo.new
  end

  def create
    @todo = Todo.create(todo_params)

    if @todo.save
      redirect_to action: 'index'
    else
      @todos = Todo.order(status: :desc)
      render :index
    end
  end

  def update
    @todo = Todo.find(params[:id])

    @todo.status = params[:status]

    @todo.save

    redirect_to action: 'index'
  end

  def destroy
    @todo = Todo.find(params[:id])

    @todo.destroy

    redirect_to action: 'index'
  end

  private

  def todo_params
    params.require(:todo).permit(:todo, :status)
  end
end
