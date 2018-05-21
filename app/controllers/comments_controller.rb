class CommentsController < ApplicationController
  before_action :logged_in_user
  before_action :admin?

  def create
    @comment = Comment.new comment_params
    @comment.save
    redirect_to task_path @comment.task_id
  end

  def destroy
    @comment = Comment.find_by id: params[:id]
    task_id = @comment.task_id
    @comment.destroy
    redirect_to task_path task_id
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :task_id)
  end
end
