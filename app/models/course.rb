class Course < ActiveRecord::Base

  belongs_to :subject
  has_many :exams

  validates :subject, presence: true


  def to_s
    self.name
  end

  def can_user_manage(user)
    self.subject.can_user_manage(user)
  end

end
