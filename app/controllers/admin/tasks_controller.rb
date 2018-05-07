class Admin::TasksController < ApplicationController
  before_action :authenticated_admin

  def index
    @tasks = Task.where thesis_id: params[:thesis_id]
  end

  def show
    @task = Task.find_by id: params[:id]
    @comments = @task.comments.order created_at: :desc
    @comment = Comment.new
  end

  private

  def load_task
    @task = Task.find_by id: params[:id]
  end
end
