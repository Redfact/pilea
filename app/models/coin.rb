class Coin < ApplicationRecord
    has_many :selections
    has_many :users, through: :selections

    #Coin's value can changes , depends on interval (daily ,hourly,...)
    has_many :values


    validates :symbol, 
    uniqueness:true, 
    presence:true

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
end
