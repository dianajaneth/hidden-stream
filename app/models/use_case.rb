class UseCase < ActiveRecord::Base
  attr_accessible :description, :design_time, :is_extra, :is_feature, :name, :programming_time
  validates :name,  :presence => true
  validates :description, :presence => true, :length => { :maximum => 500 }
  validates :design_time,  :presence => true, :numericality => true
  validates :programming_time,  :presence => true, :numericality => true

  belongs_to :quote
end
