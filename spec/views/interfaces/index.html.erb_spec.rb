require 'rails_helper'

RSpec.describe "interfaces/index", type: :view do
  before(:each) do
    assign(:interfaces, [
      Interface.create!(
        :address => "Address",
        :credentials => "Credentials",
        :user => nil
      ),
      Interface.create!(
        :address => "Address",
        :credentials => "Credentials",
        :user => nil
      )
    ])
  end

  it "renders a list of interfaces" do
    render
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Credentials".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
