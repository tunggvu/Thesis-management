class ThesesController < ApplicationController
  before_action :logged_in_user
  before_action :load_thesis, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:show, :edit, :update, :destroy]

  def index
    @theses = Thesis.where user_id: current_user.id
  end

  def show
  end

  def new
    @thesis = Thesis.new
  end

  def create
    @thesis = Thesis.new thesis_params
    if @thesis.save
      redirect_to theses_path
    else
      render :new
    end
  end

  def edit
    @percent = %w[0% 10% 20% 30% 40% 50% 60% 70% 80% 90% 100]
  end

  def update
    if @thesis.update_attributes thesis_params
      flash[:success] = "Updated"
      redirect_to @thesis
    else
      flash[:danger] = "Cannot update"
      render :edit
    end
  end

  def destroy
    @thesis.destroy
    redirect_to theses_path
  end

  private

  def thesis_params
    params.require(:thesis).permit(:name, :description, :progress, :user_id)
  end

  def load_thesis
    @thesis = Thesis.find_by id: params[:id]
  end

  def check_user
    redirect_to user_path(current_user) unless current_user == User.find_by(id: Thesis.find_by(id: params[:id]).user_id)
  end
end
