require "rails_helper"

RSpec.describe TaskTypesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/task_types").to route_to("task_types#index")
    end

    it "routes to #new" do
      expect(:get => "/task_types/new").to route_to("task_types#new")
    end

    it "routes to #show" do
      expect(:get => "/task_types/1").to route_to("task_types#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/task_types/1/edit").to route_to("task_types#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/task_types").to route_to("task_types#create")
    end

    it "routes to #update" do
      expect(:put => "/task_types/1").to route_to("task_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/task_types/1").to route_to("task_types#destroy", :id => "1")
    end

  end
end
