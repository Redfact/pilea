class CoinsController < ApplicationController
  def index
    @coins = Coin.all
    if current_user
      @selections = current_user.coins
    end
  end

  def show
    @coin = Coin.find(params[:id])
    @values = @coin.values
  end
end
