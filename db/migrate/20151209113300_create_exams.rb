class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.integer :language
      t.date :date
      t.string :description

      t.timestamps null: false
    end
  end
end
