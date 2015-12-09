require 'rails_helper'

RSpec.describe "exams/index", type: :view do
  before(:each) do
    assign(:exams, [
      Exam.create!(
        :language => 1,
        :description => "Description"
      ),
      Exam.create!(
        :language => 1,
        :description => "Description"
      )
    ])
  end

  it "renders a list of exams" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
