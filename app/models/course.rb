class Course < ActiveRecord::Base

  belongs_to :subject

  validates :subject, presence: true

end
