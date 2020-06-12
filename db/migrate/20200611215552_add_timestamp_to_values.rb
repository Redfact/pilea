class AddTimestampToValues < ActiveRecord::Migration[5.2]
  def change
    add_column :values, :timestamp, :string
  end
end
