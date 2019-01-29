class TodolistController < ApplicationController

  def create
  @todolist = Todolist.new(todo_params)
  # binding.pry
  if @todolist.save
    redirect_to todolist_index_path
  else
    render 'new'
  end
  end

  def show
    @todo = Todolist.find(params[:id])
  end

  def new
    @todolist = Todolist.new
  end

  def index
    @todolist = Todolist.all
    # binding.pry
  end

  def edit
    @todolist = Todolist.find(params[:id])
  end

  def update
    @todolist = Todolist.find(params[:id])
 
    if @todolist.update(todo_params)
      redirect_to todolist_index_path
    else
      render 'edit'
    end
  end

  def update_status
    @todo = Todolist.find(params[:todolist_id])
    @todo.update(status: params[:status])
    @todolist = Todolist.all
  rescue => e
    @todo = Todolist.find(params[:todolist_id])
  end
  
  def destroy
    @todolist = Todolist.find(params[:id])
    @todolist.destroy
    # binding.pry
    # flash[:notice] = "You have successfully delete #{@todolist.todo}."
    # redirect_to todolist_index_path
    respond_to do |format|
      format.html { redirect_to todolist_index_path }
      format.json { head :no_content }
      format.js   { render :layout => false }
   end
    
  end

  private

  def todo_params
    params.require(:todolist).permit(:todo)
  end
end
