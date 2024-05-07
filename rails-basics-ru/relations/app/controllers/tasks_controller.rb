class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(created_at: :desc)
  end
  def new
    @task = Task.new
    @users = User.all
    @statuses = Status.all
  end
  def create
    @task = Task.new(task_params)
    @task.user_id = User.find(user_params[:name]).id
    @task.status_id = Status.find(status_params[:name]).id
    if @task.save
      flash[:success] = 'New Task was successfully created'
      redirect_to task_path(@task)
    else
      flash[:failure] = 'Task cannot be created'
      render :new, status: :unprocessable_entity
    end
  end
  def show
    @task = Task.find(params[:id])
  end
  def edit
    @task = Task.find(params[:id])
    @users = User.all
    @statuses = Status.all
  end
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = 'Task was successfully updated'
      redirect_to task_path(@task)
    else
      flash[:failure] = 'Task cannot be updated'
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:success] = 'Task was successfully destroyed'
      redirect_to tasks_path
    else
      flash[:failure] = 'Task cannot be destroyed'
      redirect_to task_path(@task)
    end
  end

  private
  def task_params
    params.require(:task).permit(:name, :description)
  end

  def user_params
    params.require(:task).require(:user).permit(:name)
  end

  def status_params
    params.require(:task).require(:status).permit(:name)
  end
end