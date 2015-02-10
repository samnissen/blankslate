require 'rails_helper'

RSpec.describe "task_types/new", type: :view do
  before(:each) do
    assign(:task_type, TaskType.new(
      :name => "MyString",
      :setup => "MyText",
      :teardown => "MyText"
    ))
  end

  it "renders new task_type form" do
    render

    assert_select "form[action=?][method=?]", task_types_path, "post" do

      assert_select "input#task_type_name[name=?]", "task_type[name]"

      assert_select "textarea#task_type_setup[name=?]", "task_type[setup]"

      assert_select "textarea#task_type_teardown[name=?]", "task_type[teardown]"
    end
  end
end
