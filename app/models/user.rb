class User < ApplicationRecord
    has_many :selections
    has_many :coins, through: :selections

end
