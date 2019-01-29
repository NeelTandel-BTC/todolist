class TodolistController < ApplicationController
  def index
    todolist
  end

  def new
    @todo = todolist.new
  end

  def create
    if todolist.create(todo_params)
      redirect_to todolist_index_path
    else
      render 'new'
    end
  end

  def edit
    todo
  end

  def update
    if todo.update(todo_params)
      redirect_to todolist_index_path
    else
      render 'edit'
    end
  end

  def destroy
    todo.destroy
  end

  def show
    todo
  end

  def update_status
    todo.update(status: params[:status])
  rescue => e
    todo
  end
    
  private

  def todo_params
    params.require(:todolist).permit(:todo)
  end

  def todolist
    @todolist ||= Todolist.all
  end

  def todo
    @todo ||= todolist.find_by(id: params[:id]).tap do |todo|
      redirect_to root_path if todo.blank?
    end
  end
end
