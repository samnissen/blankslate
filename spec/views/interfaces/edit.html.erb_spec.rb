require 'rails_helper'

RSpec.describe "interfaces/edit", type: :view do
  before(:each) do
    @interface = assign(:interface, Interface.create!(
      :address => "MyString",
      :credentials => "MyString",
      :user => nil
    ))
  end

  it "renders the edit interface form" do
    render

    assert_select "form[action=?][method=?]", interface_path(@interface), "post" do

      assert_select "input#interface_address[name=?]", "interface[address]"

      assert_select "input#interface_credentials[name=?]", "interface[credentials]"

      assert_select "input#interface_user_id[name=?]", "interface[user_id]"
    end
  end
end
