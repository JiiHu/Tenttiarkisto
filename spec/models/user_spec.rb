require 'rails_helper'

RSpec.describe User, type: :model do

  it "has the organization set correctly" do
    user = User.new organization:"asd"

    expect(user.organization).to eq("asd")
  end

  describe "with incorrect sign up info" do
    it "is not saved without a password" do
      user = User.create organization:"asd"

      expect(user).not_to be_valid
      expect(User.count).to eq(0)
    end

    it "is not saved with incorrect password_confirmation" do
      user = User.create organization:"asd", password:"asd", password_confirmation:"asdd"

      expect(user).not_to be_valid
      expect(User.count).to eq(0)
    end

    it "is not saved with too short password" do
      user = User.create organization:"asd", password:"asd", password_confirmation:"asd"

      expect(user).not_to be_valid
      expect(User.count).to eq(0)
    end
  end

  describe "with proper sign up info" do
    let(:user){ FactoryGirl.create(:user) }

    it "is saved" do
      expect(user).to be_valid
      expect(User.count).to eq(1)
    end


  end
end
