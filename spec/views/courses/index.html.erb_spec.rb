require 'rails_helper'

RSpec.describe "courses/index", type: :view do
  before(:each) do
    assign(:courses, [
      Course.create!(
        :name => "Name",
        :identifier => "Identifier",
        :subject_id => 1
      ),
      Course.create!(
        :name => "Name",
        :identifier => "Identifier",
        :subject_id => 1
      )
    ])
  end

  it "renders a list of courses" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Identifier".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
