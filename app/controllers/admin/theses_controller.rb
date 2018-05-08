class Admin::ThesesController < ApplicationController
  before_action :authenticated_admin
  before_action :load_thesis, except: [:index, :new, :create]

  def index
    @theses = Thesis.all
  end

  def new
    @thesis = Thesis.new
    @users = User.where(role: "student")
  end

  def create
    @thesis = Thesis.new thesis_params
    if @thesis.save
      redirect_to admin_theses_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    @users = User.where(role: "student")
  end

  def update
    if @thesis.update_attributes thesis_params
      flash[:success] = "Updated"
      redirect_to admin_thesis_path @thesis
    else
      flash[:danger] = "Cannot update"
      render :edit
    end
  end

  def destroy
    @thesis.destroy
    redirect_to admin_theses_path
  end

  def approved
    @thesis.update_attributes status: "approved"
    redirect_to admin_theses_path
  end

  def rejected
    @thesis.update_attributes status: "rejected"
    redirect_to admin_theses_path
  end

  private

  def load_thesis
    @thesis = Thesis.find_by id: params[:id]
  end

  def thesis_params
    params.require(:thesis).permit(:name, :description, :progress, :user_id)
  end
end
