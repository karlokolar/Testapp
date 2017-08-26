class TodosController < ApplicationController

  before_action :set_todo, only: [:show, :update, :edit, :destroy]

  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to todo_path(@todo)
      flash[:notice] = "Todo has been created!"
    else
      render "new"
    end
  end

  def show

  end

  def edit

  end

  def update
    if @todo.update(todo_params)
      redirect_to todo_path(@todo)
      flash[:notice] = "Todo was successfully updated"
    else
      render "edit"
    end
  end

  def destroy
    @todo.destroy
    flash[:notice] = "Todo was delted successfully"
    redirect_to todos_path
  end

  private

    def todo_params
      params.require(:todo).permit(:name, :description)
    end

    def set_todo
      @todo = Todo.find(params[:id])
    end

end
