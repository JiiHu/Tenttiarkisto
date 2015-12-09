class AddFilepathToExam < ActiveRecord::Migration
  def change
    add_column :exams, :filepath, :string, default: nil
  end
end
