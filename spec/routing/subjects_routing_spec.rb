require "rails_helper"

RSpec.describe SubjectsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/subjects").to route_to("subjects#index")
    end

    it "routes to #new" do
      expect(:get => "/subjects/new").to route_to("subjects#new")
    end

    it "routes to #show" do
      expect(:get => "/subjects/1").to route_to("subjects#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/subjects/1/edit").to route_to("subjects#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/subjects").to route_to("subjects#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/subjects/1").to route_to("subjects#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/subjects/1").to route_to("subjects#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/subjects/1").to route_to("subjects#destroy", :id => "1")
    end

  end
end
