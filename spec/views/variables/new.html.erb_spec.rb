require 'rails_helper'

RSpec.describe "variables/new", type: :view do
  before(:each) do
    assign(:variable, Variable.new(
      :prompt => "MyString",
      :name => "MyString",
      :validation_type => "MyString",
      :validation => "MyString",
      :task => nil
    ))
  end

  it "renders new variable form" do
    render

    assert_select "form[action=?][method=?]", variables_path, "post" do

      assert_select "input#variable_prompt[name=?]", "variable[prompt]"

      assert_select "input#variable_name[name=?]", "variable[name]"

      assert_select "input#variable_validation_type[name=?]", "variable[validation_type]"

      assert_select "input#variable_validation[name=?]", "variable[validation]"

      assert_select "input#variable_task_id[name=?]", "variable[task_id]"
    end
  end
end
