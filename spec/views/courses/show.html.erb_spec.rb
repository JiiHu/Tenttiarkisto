require 'rails_helper'

RSpec.describe "courses/show", type: :view do
  before(:each) do
    @course = assign(:course, Course.create!(
      :name => "Name",
      :identifier => "Identifier",
      :subject_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Identifier/)
    expect(rendered).to match(/1/)
  end
end
