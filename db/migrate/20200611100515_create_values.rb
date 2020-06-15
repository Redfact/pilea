class CreateValues < ActiveRecord::Migration[5.2]
  def change
    create_table :values do |t|
      t.belongs_to :coin , index: true 
      t.decimal :price
      t.bigint :volume
      t.bigint :market_cap
      t.datetime :time
      t.integer :interval, default: 0
      t.timestamps
    end
  end
end
