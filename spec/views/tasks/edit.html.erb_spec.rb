require 'rails_helper'

RSpec.describe "tasks/edit", type: :view do
  before(:each) do
    @task = assign(:task, Task.create!(
      :name => "MyString",
      :description => "MyString",
      :code => "MyText",
      :variables => "MyText",
      :task_type => nil
    ))
  end

  it "renders the edit task form" do
    render

    assert_select "form[action=?][method=?]", task_path(@task), "post" do

      assert_select "input#task_name[name=?]", "task[name]"

      assert_select "input#task_description[name=?]", "task[description]"

      assert_select "textarea#task_code[name=?]", "task[code]"

      assert_select "textarea#task_variables[name=?]", "task[variables]"

      assert_select "input#task_task_type_id[name=?]", "task[task_type_id]"
    end
  end
end
