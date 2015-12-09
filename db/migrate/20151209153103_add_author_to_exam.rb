class AddAuthorToExam < ActiveRecord::Migration
  def change
    add_column :exams, :author, :string
  end
end
