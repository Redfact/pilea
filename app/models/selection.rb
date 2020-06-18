class Selection < ApplicationRecord
    belongs_to :user
    belongs_to :coin  
    
    validates_uniqueness_of :coin_id, :scope => :user_id
    
end
