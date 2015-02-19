require 'rails_helper'

RSpec.describe "variables/index", type: :view do
  before(:each) do
    assign(:variables, [
      Variable.create!(
        :prompt => "Prompt",
        :name => "Name",
        :validation_type => "Validation Type",
        :validation => "Validation",
        :task => nil
      ),
      Variable.create!(
        :prompt => "Prompt",
        :name => "Name",
        :validation_type => "Validation Type",
        :validation => "Validation",
        :task => nil
      )
    ])
  end

  it "renders a list of variables" do
    render
    assert_select "tr>td", :text => "Prompt".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Validation Type".to_s, :count => 2
    assert_select "tr>td", :text => "Validation".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
