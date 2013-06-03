class Quote < ActiveRecord::Base
  attr_accessible :cost_per_hour, :description, :hours_per_day, :name
  validates :name,  :presence => true, :uniqueness => true
  validates :description, :presence => true, :length => { :maximum => 500 }
  validates :cost_per_hour,  :presence => true, :numericality => true
  validates :hours_per_day,  :presence => true, :numericality => true

  has_many :use_cases

  after_initialize :default_values

  private
    def default_values
      self.total_cost ||= 0
      self.total_hours ||= 0
      self.status ||= "nueva"
    end

end
