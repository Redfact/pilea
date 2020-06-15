class CoinsController < ApplicationController
  def index
    @coins = Coin.all
  end

  def show
    @coin = Coin.find(params[:id])
    @values = @coin.values
  end

  def to_price(value)
    number_to_currency(value, :unit => "$", :separator => " ", :delimiter => ".")
  end
end
