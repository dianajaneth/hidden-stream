class QuotesTotalHours < ActiveRecord::Migration
  def up
      add_column :quotes, :total_hours, :float
  end

  def down
      remove_column :quotes, :total_hours
  end
end
