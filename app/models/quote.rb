class Quote < ActiveRecord::Base
  attr_accessible :cost_per_hour, :description, :hours_per_day, :name
  validates :name,  :presence => true, :uniqueness => true
  validates :description, :presence => true, :length => { :maximum => 500 }
  validates :cost_per_hour,  :presence => true, :numericality => true
  validates :hours_per_day,  :presence => true, :numericality => true
end
