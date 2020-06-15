class Coin < ApplicationRecord
    has_many :selections
    has_many :users, through: :selections

    #Coin's value can changes , depends on interval (daily ,hourly,...)
    has_many :values


    validates :symbol, 
    uniqueness:true, 
    presence:true , 
    length: {in: 1..3}


    def 
        
    end
    

    
end
