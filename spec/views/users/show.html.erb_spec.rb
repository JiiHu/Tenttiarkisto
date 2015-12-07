require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :organization => "Organization"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Organization/)
  end
end
