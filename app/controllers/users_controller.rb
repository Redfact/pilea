class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.admin?
      render :index
    else
      redirect_to root_path
    end
  end
  
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
  
end
