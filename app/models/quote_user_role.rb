class QuoteUserRole < ActiveRecord::Base
  self.table_name = 'quotes_users_roles'
  
  attr_accessible :quote_id, :user_id, :role_id
end
