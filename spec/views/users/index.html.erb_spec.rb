require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :organization => "Organization"
      ),
      User.create!(
        :organization => "Organization"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Organization".to_s, :count => 2
  end
end
