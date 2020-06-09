class Coin < ApplicationRecord
    has_many :selections
    has_many :users, through: :selections
    
    validates :symbole, 
    uniqueness:true, 
    presence:true , 
    length: {in: 1..20}
end
