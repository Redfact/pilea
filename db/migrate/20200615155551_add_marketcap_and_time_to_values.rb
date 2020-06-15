class AddMarketcapAndTimeToValues < ActiveRecord::Migration[5.2]
  def change
    add_column :values, :time, :bigint
  end
end
