class Value < ApplicationRecord
    belongs_to :coin

    enum interval: { minutely: 0, hourly: 1, daily: 2}

    
end
