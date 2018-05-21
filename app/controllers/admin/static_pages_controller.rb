class Admin::StaticPagesController < ApplicationController
  before_action :authenticated_admin

  def home
  end
end
