class CommentsController < ApplicationController
  before_action :logged_in_user
  
  def create    
    @comment = Comment.new comment_params
    if @comment.save
      redirect_to task_path @comment.task_id
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :task_id)
  end
end