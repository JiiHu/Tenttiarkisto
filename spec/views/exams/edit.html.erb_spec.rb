require 'rails_helper'

RSpec.describe "exams/edit", type: :view do
  before(:each) do
    @exam = assign(:exam, Exam.create!(
      :language => 1,
      :description => "MyString"
    ))
  end

  it "renders the edit exam form" do
    render

    assert_select "form[action=?][method=?]", exam_path(@exam), "post" do

      assert_select "input#exam_language[name=?]", "exam[language]"

      assert_select "input#exam_description[name=?]", "exam[description]"
    end
  end
end
