class Value < ApplicationRecord
    belongs_to :coin

    enum interval: { hourly: 0, daily: 1, weekly: 2}
end
