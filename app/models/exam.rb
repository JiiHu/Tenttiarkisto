class Exam < ActiveRecord::Base

  belongs_to :course
  has_one :subject, through: :course

  enum language: {
    Finnish: 0,
    Swedish: 1,
    English: 2
  }

  filterrific(
  available_filters: [
    :search_query
  ]
  )

  scope :search_query, lambda { |query|
    return nil if query.blank?
    where("(LOWER(exams.author) LIKE '%"+query.to_s.downcase+"%')"+
          " OR (LOWER(exams.description) LIKE '%"+query.to_s.downcase+"%')"+
          " OR (exams.date LIKE '%"+query.to_s.downcase+"%')"
          )
  }

  def can_user_manage(user)
    self.course.can_user_manage(user)
  end

end
