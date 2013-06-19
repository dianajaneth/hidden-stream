class CreateQuotesUsersRoles < ActiveRecord::Migration
  def change
    create_table :quotes_users_roles do |t|
      t.references :quote
      t.references :user
      t.references :role
    end
  end
end
