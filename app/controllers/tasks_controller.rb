class TasksController < ApplicationController
  before_action :load_task, only: [:edit, :update, :destroy]

  def index
    @tasks = Task.where thesis_id: params[:thesis_id]
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new task_params
    if @task.save
      redirect_to tasks_path thesis_id: @task.thesis_id
    else
      render :new
    end
  end

  def show
    @task = Task.find_by id: params[:id]
    @comments = @task.comments
  end

  def edit
  end

  def update
    if @task.update_attributes task_params
      redirect_to tasks_path thesis_id: @task.thesis_id
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path thesis_id: @task.thesis.id
  end

  private

  def task_params
    params.require(:task).permit(:name, :status, :thesis_id)
  end

  def load_task
    @task = Task.find_by id: params[:id]
  end
end
