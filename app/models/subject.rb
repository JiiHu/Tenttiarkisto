class Subject < ActiveRecord::Base

  has_many :courses
  has_and_belongs_to_many :users


end
