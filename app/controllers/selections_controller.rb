class SelectionsController < ApplicationController
 before_action :Signed?, only: [:create,:destroy]

  def index
    @selections = current_user.coins
    unless current_user
      redirect_to root_path
    end
  end

  def Signed?
    unless(user_signed_in?)
      redirect_to new_user_session_path
    end
  end

  
  def create
    puts "Controller Create selection"
    @selection = Selection.create(coin_id:params[:id], user_id: current_user.id)
    respond_to do |format|
        format.html do 
            redirect_to root_path
        end
        format.js do
        end
    end
  end

  def destroy
    puts "Controller destroy selection"

    @selection=Selection.find_by(coin_id: params[:id])
    if( @selection != nil)
        @selection.destroy
    else
        puts "selection don't exist or already destroyed !"
    end
    respond_to do |format|
        format.html do 
            redirect_to root_path
        end
        format.js do
        end
    end 
  end

end
