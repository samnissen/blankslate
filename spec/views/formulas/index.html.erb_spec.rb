require 'rails_helper'

RSpec.describe "formulas/index", type: :view do
  before(:each) do
    assign(:formulas, [
      Formula.create!(
        :name => "Name",
        :description => "Description",
        :task => ""
      ),
      Formula.create!(
        :name => "Name",
        :description => "Description",
        :task => ""
      )
    ])
  end

  it "renders a list of formulas" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
