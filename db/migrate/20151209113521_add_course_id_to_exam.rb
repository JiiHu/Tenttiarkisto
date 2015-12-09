class AddCourseIdToExam < ActiveRecord::Migration
  def change
    add_column :exams, :course_id, :integer
  end
end
