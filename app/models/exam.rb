class Exam < ActiveRecord::Base

  belongs_to :course

  enum language: {
    finnish: 0,
    swedish: 1,
    english: 2
  }

end
