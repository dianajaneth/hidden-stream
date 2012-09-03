class ChangeQuoteDescription < ActiveRecord::Migration
  def up
      remove_column :quotes, :description
      add_column :quotes, :description, :text
  end

  def down
      remove_column :quotes, :description
      add_column :quotes, :description, :text
  end
end
