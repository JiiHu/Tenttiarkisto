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
  default_filter_params: { sorted_by: 'name_asc' },
  available_filters: [
    :sorted_by,
    :search_query
  ]
  )

  scope :search_query, lambda { |query|
	  return nil if query.blank?
	  where("LOWER(courses.name) LIKE '%"+query.to_s.downcase+"%'")
	}

	scope :sorted_by, lambda { |sort_option|
	  # extract the sort direction from the param value.
	  direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
	  case sort_option.to_s
	  when /^name_/
	    # Simple sort on the name colums
	    order("LOWER(courses.name) #{ direction }")
	  else
	    raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
	  end
	}

end
