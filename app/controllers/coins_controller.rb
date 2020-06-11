class CoinsController < ApplicationController
  def index
    @coin = Coin.all
  end

  def show
  end
end
