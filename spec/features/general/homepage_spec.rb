require "rails_helper"

RSpec.feature "Homepage", type: :feature do

  context "Visiting homepage" do
    before(:each) do
      visit root_path
    end

    scenario "will show content" do
      expect(page.html).not_to have_text 'Error'
    end

  end
end
