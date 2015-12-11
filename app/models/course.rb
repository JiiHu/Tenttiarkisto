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

  filterrific(
  available_filters: [
    :search_query
  ]
  )

  scope :search_query, lambda { |query|
	  return nil if query.blank?
    q='%'+query.to_s.downcase+'%'
	  where("(LOWER(courses.name) LIKE ?) OR 
           (LOWER(courses.identifier) LIKE ?) OR 
           (LOWER(courses.keywords) LIKE ?)", q, q, q)
	}

end
