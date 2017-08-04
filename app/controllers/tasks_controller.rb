class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def new #作成ページ
    @task = Task.new
  end
  
  def create
    @task = Task.find(task_params)
    if @task.save
      flash[:success] = 'YOU SUCCESS TO MAKE NEW TASK!'
      redirect_to root_path
    else
      flash.now[:danger] = 'YOU COULDNT MAKE NEW TASK! PLS TRY AGAIN'
      render new_task_path
    end
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(task_params)
    if @task.update
      flash[:success] = 'You edited correctly!'
      redirect_to task_path
    else
      flash.now[:danger] = 'You couldnt edit the task! Try it again'
      render edit_task_path
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    flash[:success] = 'You deleted the task!'
    redirect_to root_path
  end
  
  
  private
  def task_params
    params.require(:task).permit(:content)
  end
end
