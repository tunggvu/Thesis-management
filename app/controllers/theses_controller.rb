class ThesesController < ApplicationController
  def new
    @thesis = Thesis.new user_id: current_user.id
  end

  def create
  end
end
