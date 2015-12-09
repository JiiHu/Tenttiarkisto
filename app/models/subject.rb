class Subject < ActiveRecord::Base

  has_many :courses
  has_and_belongs_to_many :users

  validates :name, presence: true


  filterrific(
  default_filter_params: { sorted_by: 'name_asc' },
  available_filters: [
    :sorted_by,
    :search_query
  ]
  )

  scope :search_query, lambda { |query|
    return nil  if query.blank?
    where("LOWER(subjects.name) LIKE '%"+query.to_s.downcase+"%'")
  }

  scope :sorted_by, lambda { |sort_option|
    # extract the sort direction from the param value.
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^name_/
      # Simple sort on the name colums
      order("LOWER(subjects.name) #{ direction }")
    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }

  def to_s
    self.name
  end

  def can_user_manage(user)
    return true if user.is_super_admin
    self.users.include?(user)
  end

end
