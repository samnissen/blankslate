require 'rails_helper'

RSpec.describe "missions/new", type: :view do
  before(:each) do
    assign(:mission, Mission.new(
      :user => nil,
      :class_name => "MyString",
      :class_code => "MyString",
      :variables => "MyString",
      :interface => nil
    ))
  end

  it "renders new mission form" do
    render

    assert_select "form[action=?][method=?]", missions_path, "post" do

      assert_select "input#mission_user_id[name=?]", "mission[user_id]"

      assert_select "input#mission_class_name[name=?]", "mission[class_name]"

      assert_select "input#mission_class_code[name=?]", "mission[class_code]"

      assert_select "input#mission_variables[name=?]", "mission[variables]"

      assert_select "input#mission_interface_id[name=?]", "mission[interface_id]"
    end
  end
end
