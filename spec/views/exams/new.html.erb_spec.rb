require 'rails_helper'

RSpec.describe "exams/new", type: :view do
  before(:each) do
    assign(:exam, Exam.new(
      :language => 1,
      :description => "MyString"
    ))
  end

  it "renders new exam form" do
    render

    assert_select "form[action=?][method=?]", exams_path, "post" do

      assert_select "input#exam_language[name=?]", "exam[language]"

      assert_select "input#exam_description[name=?]", "exam[description]"
    end
  end
end
