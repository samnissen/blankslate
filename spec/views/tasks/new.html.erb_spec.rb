require 'rails_helper'

RSpec.describe "tasks/new", type: :view do
  before(:each) do
    assign(:task, Task.new(
      :name => "MyString",
      :description => "MyString",
      :code => "MyText",
      :variables => "MyText",
      :task_type => nil
    ))
  end

  it "renders new task form" do
    render

    assert_select "form[action=?][method=?]", tasks_path, "post" do

      assert_select "input#task_name[name=?]", "task[name]"

      assert_select "input#task_description[name=?]", "task[description]"

      assert_select "textarea#task_code[name=?]", "task[code]"

      assert_select "textarea#task_variables[name=?]", "task[variables]"

      assert_select "input#task_task_type_id[name=?]", "task[task_type_id]"
    end
  end
end
