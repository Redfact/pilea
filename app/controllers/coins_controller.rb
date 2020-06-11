class CoinsController < ApplicationController
  def index
    @coins = Coin.all
  end

  def show
    @coins = Coin.find(params[:id])
  end
end
