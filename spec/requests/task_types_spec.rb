require 'rails_helper'

RSpec.describe "TaskTypes", type: :request do
  describe "GET /task_types" do
    it "works! (now write some real specs)" do
      get task_types_path
      expect(response).to have_http_status(200)
    end
  end
end
