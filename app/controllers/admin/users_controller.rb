class Admin::UsersController < ApplicationController
  before_action :authenticated_admin
  before_action :load_user

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      redirect_to admin_user_path @user
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
  end
end
