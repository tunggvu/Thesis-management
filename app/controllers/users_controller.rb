class UsersController < ApplicationController
  before_action :logged_in_user
  before_action :load_user

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = "Updated"
      redirect_to @user
    else
      flash[:danger] = "Cannot update"
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
