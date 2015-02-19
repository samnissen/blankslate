require 'rails_helper'

RSpec.describe "formulas/show", type: :view do
  before(:each) do
    @formula = assign(:formula, Formula.create!(
      :name => "Name",
      :description => "Description",
      :task => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(//)
  end
end
