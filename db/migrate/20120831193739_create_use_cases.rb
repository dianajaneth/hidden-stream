class CreateUseCases < ActiveRecord::Migration
  def change
    create_table :use_cases do |t|
      t.string :name
      t.text :description
      t.float :design_time
      t.float :programming_time
      t.integer :is_extra
      t.integer :is_feature

      t.timestamps
    end
  end
end
