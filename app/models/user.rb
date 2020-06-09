class User < ApplicationRecord
    has_many :selections
    has_many :coins, through: :selections

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
