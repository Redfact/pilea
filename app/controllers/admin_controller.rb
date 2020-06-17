class AdminController < ApplicationController
  def index
    if current_user.admin?
      render :index
    else
      redirect_to root_path
    end
  end
end
