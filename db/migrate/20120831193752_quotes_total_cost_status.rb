class QuotesTotalCostStatus < ActiveRecord::Migration
  def up
      add_column :quotes, :status, :string
      add_column :quotes, :total_cost, :float
  end

  def down
      remove_column :quotes, :status
      remove_column :quotes, :total_cost
  end
end
