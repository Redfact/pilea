class AddDetailsToCoin < ActiveRecord::Migration[5.2]
  def change
    add_column :coins, :name, :string
    add_column :coins, :logo, :string
  end
end
