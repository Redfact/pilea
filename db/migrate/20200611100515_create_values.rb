class CreateValues < ActiveRecord::Migration[5.2]
  def change
    create_table :values do |t|
      t.belongs_to :coin , index: true 
      t.integer :price
      t.bigint :volume
      t.string :interval
      t.timestamps
    end
  end
end
