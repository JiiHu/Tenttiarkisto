class Course < ActiveRecord::Base

  belongs_to :subject

  validates :subject, presence: true

  def can_user_manage(user)
    self.subject.can_user_manage(user)
  end

end
