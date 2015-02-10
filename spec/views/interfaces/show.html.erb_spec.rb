require 'rails_helper'

RSpec.describe "interfaces/show", type: :view do
  before(:each) do
    @interface = assign(:interface, Interface.create!(
      :address => "Address",
      :credentials => "Credentials",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Credentials/)
    expect(rendered).to match(//)
  end
end
