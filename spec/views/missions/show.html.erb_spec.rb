require 'rails_helper'

RSpec.describe "missions/show", type: :view do
  before(:each) do
    @mission = assign(:mission, Mission.create!(
      :user => nil,
      :class_name => "Class Name",
      :class_code => "Class Code",
      :variables => "Variables",
      :interface => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Class Name/)
    expect(rendered).to match(/Class Code/)
    expect(rendered).to match(/Variables/)
    expect(rendered).to match(//)
  end
end
