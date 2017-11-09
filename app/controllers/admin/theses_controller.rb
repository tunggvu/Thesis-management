class Admin::ThesesController < ApplicationController
  before_action :authenticated_admin
  before_action :load_thesis

  def index
    @theses = Thesis.all
  end

  def show
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
end
