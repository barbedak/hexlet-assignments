# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update]

  def index
    @tasks = Task.all.order(created_at: :desc)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = 'New task was successfully created'
      redirect_to root_path
    else
      flash[:failure] = 'Task cannot be created'
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
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
      flash[:success] = 'Task was successfully deleted'
      redirect_to root_path
    else
      flash[:failure] = 'Task cannot be deleted'
      redirect_to task_path(@task)
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:id, :name, :description, :status, :creator, :performer, :completed)
  end
end
