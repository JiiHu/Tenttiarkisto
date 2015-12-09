class Subject < ActiveRecord::Base

  has_many :courses
  has_and_belongs_to_many :users


  def can_user_manage(user)
    self.users.include?(user)
  end

end
