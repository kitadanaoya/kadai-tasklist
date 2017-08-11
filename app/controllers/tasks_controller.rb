class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]  
  
  def index
    @tasks = Task.order(created_at: :asc).page(params[:page]).per(10)
  end
  
  def show
  end
  
  def new #作成ページ
    @task = Task.new
  end
  
  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = 'YOU SUCCESS TO MAKE NEW TASK!'
      redirect_to root_url
    else
      flash.now[:danger] = 'YOU COULDNT MAKE NEW TASK! PLS TRY AGAIN'
      render new_task_path
    end
  end
  
  def edit
  end
  
  def update
    if @task.update(task_params)
      flash[:success] = 'You edited correctly!'
      redirect_to task_path
    else
      flash.now[:danger] = 'You couldnt edit the task! Try it again'
      render edit_task_path
    end
  end
  
  def destroy
    @task.destroy
    
    flash[:success] = 'You deleted the task!'
    redirect_to root_path
  end
  
  
  private
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
  def set_task
    @task = Task.find(params[:id])
  end
end
