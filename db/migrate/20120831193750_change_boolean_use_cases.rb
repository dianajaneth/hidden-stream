class ChangeBooleanUseCases < ActiveRecord::Migration
  def up
      remove_column :use_cases, :is_extra
      remove_column :use_cases, :is_feature
      add_column :use_cases, :is_extra, :boolean
      add_column :use_cases, :is_feature, :boolean
  end

  def down
      remove_column :use_cases, :is_extra
      remove_column :use_cases, :is_feature
      add_column :use_cases, :is_extra, :integer
      add_column :use_cases, :is_feature, :integer
  end
end
