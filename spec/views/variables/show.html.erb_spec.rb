require 'rails_helper'

RSpec.describe "variables/show", type: :view do
  before(:each) do
    @variable = assign(:variable, Variable.create!(
      :prompt => "Prompt",
      :name => "Name",
      :validation_type => "Validation Type",
      :validation => "Validation",
      :task => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Prompt/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Validation Type/)
    expect(rendered).to match(/Validation/)
    expect(rendered).to match(//)
  end
end
