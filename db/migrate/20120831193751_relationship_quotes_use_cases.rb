class RelationshipQuotesUseCases < ActiveRecord::Migration
  def up
      add_column :use_cases, :quote_id, :integer
  end

  def down
      remove_column :use_cases, :quote_id
  end
end
