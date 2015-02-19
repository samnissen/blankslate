require 'rails_helper'

RSpec.describe "variables/edit", type: :view do
  before(:each) do
    @variable = assign(:variable, Variable.create!(
      :prompt => "MyString",
      :name => "MyString",
      :validation_type => "MyString",
      :validation => "MyString",
      :task => nil
    ))
  end

  it "renders the edit variable form" do
    render

    assert_select "form[action=?][method=?]", variable_path(@variable), "post" do

      assert_select "input#variable_prompt[name=?]", "variable[prompt]"

      assert_select "input#variable_name[name=?]", "variable[name]"

      assert_select "input#variable_validation_type[name=?]", "variable[validation_type]"

      assert_select "input#variable_validation[name=?]", "variable[validation]"

      assert_select "input#variable_task_id[name=?]", "variable[task_id]"
    end
  end
end
