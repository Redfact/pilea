class Coin < ApplicationRecord
    validates :symbole, 
    uniqueness:true, 
    presence:true , 
    length: {in: 1..20}
end
