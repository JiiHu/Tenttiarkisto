class AddApprovedToExams < ActiveRecord::Migration
  def change
  	add_column :exams, :approved, :boolean, default: false
  	add_column :exams, :rejected, :boolean, default: false
  end
end
