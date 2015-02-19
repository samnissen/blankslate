require 'rails_helper'

RSpec.describe "Variables", type: :request do
  describe "GET /variables" do
    it "works! (now write some real specs)" do
      get variables_path
      expect(response).to have_http_status(200)
    end
  end
end
