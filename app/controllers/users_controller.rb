class UsersController < ApplicationController
  before_action :logged_in_user
  before_action :admin?
  before_action :load_user
  before_action :check_user

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def load_user
    @user = User.find_by id: params[:id]
    redirect_to login_path unless @user
  end

  def check_user
    redirect_to user_path(current_user) unless current_user == User.find_by(id: params[:id])
  end
end
