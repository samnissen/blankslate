require 'rails_helper'

RSpec.describe "Formulas", type: :request do
  describe "GET /formulas" do
    it "works! (now write some real specs)" do
      get formulas_path
      expect(response).to have_http_status(200)
    end
  end
end
