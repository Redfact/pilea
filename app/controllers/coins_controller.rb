class CoinsController < ApplicationController
  def index
    @coin = Coin.find(params[:id])
  end

  def show
  end
end
