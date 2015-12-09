class AddKeywordsToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :keywords, :string
  end
end
