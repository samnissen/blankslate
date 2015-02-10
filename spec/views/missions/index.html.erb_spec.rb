require 'rails_helper'

RSpec.describe "missions/index", type: :view do
  before(:each) do
    assign(:missions, [
      Mission.create!(
        :user => nil,
        :class_name => "Class Name",
        :class_code => "Class Code",
        :variables => "Variables",
        :interface => nil
      ),
      Mission.create!(
        :user => nil,
        :class_name => "Class Name",
        :class_code => "Class Code",
        :variables => "Variables",
        :interface => nil
      )
    ])
  end

  it "renders a list of missions" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Class Name".to_s, :count => 2
    assert_select "tr>td", :text => "Class Code".to_s, :count => 2
    assert_select "tr>td", :text => "Variables".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
