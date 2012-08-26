class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :name
      t.string :description
      t.float :cost_per_hour
      t.integer :hours_per_day

      t.timestamps
    end
  end
end
