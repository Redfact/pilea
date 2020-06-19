class Coin < ApplicationRecord
    has_many :selections
    has_many :users, through: :selections

    #Coin's values can change, depends on interval (daily ,hourly,...)
    has_many :values

    validates :symbol, uniqueness:true, presence:true
    validates :name, uniqueness:true, presence:true

    def minutely
      array = []
      values.each{ |index|
          if(index.minutely?)
              array << index
          end
      }
      return array 
    end

    def daily
      array = []
      values.each{ |index|
          if(index.daily?)
              array << index
          end
      }
      return array
    end

    def hourly
        array = []
        values.each{ |index|
            if(index.hourly?)
                array << index
            end
        }
        return array 
    end

    def has_interval_values?(interval)
      case interval
        when 'daily'
          self.values.daily.any?
        when 'hourly'
          self.values.hourly.any?
        end
    end

    include ActionView::Helpers::NumberHelper

    def last_price
      number_to_currency(self.values.hourly.last.price, :unit => "$ ", :delimiter => ",", :separator => ".")
    end
    
    def last_volume
      number_to_currency(self.values.hourly.last.volume, :unit => "$ ", :delimiter => ",", :precision => 0)
    end

    def last_market_cap
      number_to_currency(self.values.hourly.last.market_cap, :unit => "$ ", :delimiter => ",", :precision => 0)
    end
end
