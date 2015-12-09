class Subject < ActiveRecord::Base

  has_many :courses
  has_and_belongs_to_many :users

	filterrific(
  available_filters: [
    :search_query
  ]
  )

  scope :search_query, lambda { |query|
	  return nil  if query.blank?
	  where("LOWER(subjects.name) LIKE '%"+query.to_s.downcase+"%'").order("LOWER(subjects.name) asc")
	}

  def can_user_manage(user)
    self.users.include?(user)
  end

end
