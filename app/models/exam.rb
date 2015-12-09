class Exam < ActiveRecord::Base

  belongs_to :course

  enum language: {
    Finnish: 0,
    Swedish: 1,
    English: 2
  }

  def can_user_manage(user)
    self.course.can_user_manage(user)
  end

end
