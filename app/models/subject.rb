class Subject < ActiveRecord::Base

  has_many :courses
  has_and_belongs_to_many :users

  validates :name, presence: true

  filterrific(
  available_filters: [
    :search_query
  ]
  )

  scope :search_query, lambda { |query|
	  return nil  if query.blank?
	  where("LOWER(subjects.name) LIKE ?", '%'+query.to_s.downcase+'%')
	}

  def to_s
    self.name
  end

  def can_user_manage(user)
    return true if user.is_super_admin
    self.users.include?(user)
  end

end
