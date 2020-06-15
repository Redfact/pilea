class RemoveTimestampsToValues < ActiveRecord::Migration[5.2]
  def change
    remove_column :values, :timestamp, :string
  end
end
