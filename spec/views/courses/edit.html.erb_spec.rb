require 'rails_helper'

RSpec.describe "courses/edit", type: :view do
  before(:each) do
    @course = assign(:course, Course.create!(
      :name => "MyString",
      :identifier => "MyString",
      :subject_id => 1
    ))
  end

  it "renders the edit course form" do
    render

    assert_select "form[action=?][method=?]", course_path(@course), "post" do

      assert_select "input#course_name[name=?]", "course[name]"

      assert_select "input#course_identifier[name=?]", "course[identifier]"

      assert_select "input#course_subject_id[name=?]", "course[subject_id]"
    end
  end
end
