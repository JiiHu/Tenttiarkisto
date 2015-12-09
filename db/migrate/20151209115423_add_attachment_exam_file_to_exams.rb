class AddAttachmentExamFileToExams < ActiveRecord::Migration
  def self.up
    change_table :exams do |t|
      t.attachment :exam_file
    end
  end

  def self.down
    remove_attachment :exams, :exam_file
  end
end
