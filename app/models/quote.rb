class Quote < ActiveRecord::Base
  attr_accessible :cost_per_hour, :description, :hours_per_day, :name
  attr_accessor :user_id
  validates :name,  :presence => true, :uniqueness => true
  validates :description, :presence => true, :length => { :maximum => 500 }
  validates :cost_per_hour,  :presence => true, :numericality => true
  validates :hours_per_day,  :presence => true, :numericality => true

  has_many :use_cases
  has_and_belongs_to_many :users
  has_and_belongs_to_many :roles

  after_initialize :default_values
#  after_create :set_quotes_users_roles

  private
    def default_values
      self.total_cost ||= 0
      self.total_hours ||= 0
      self.status ||= "nueva"
    end

 #   def set_quotes_users_roles
 #     owner = Role.find_by_name('owner')
 #     QuoteUserRole.create(quote_id: id, user_id: user_id, role_id: owner.id)
 #   end

end
