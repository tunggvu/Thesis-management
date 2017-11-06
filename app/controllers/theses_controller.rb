class ThesesController < ApplicationController
  before_action :load_thesis, only: [:show, :edit, :update]
  def show
  end

  def new
    @thesis = Thesis.new
  end

  def create
    @thesis = Thesis.new thesis_params
    if @thesis.save
      flash[:success] = "Create success"
      redirect_to thesis_path @thesis
    else
      flash[:danger] = "Create fail"
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

  private

  def thesis_params
    params.require(:thesis).permit(:name, :description, :progress, :user_id)
  end

  def load_thesis
    @thesis = Thesis.find_by id: params[:id]
  end
end
