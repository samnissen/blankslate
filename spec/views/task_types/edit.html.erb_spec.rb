require 'rails_helper'

RSpec.describe "task_types/edit", type: :view do
  before(:each) do
    @task_type = assign(:task_type, TaskType.create!(
      :name => "MyString",
      :setup => "MyText",
      :teardown => "MyText"
    ))
  end

  it "renders the edit task_type form" do
    render

    assert_select "form[action=?][method=?]", task_type_path(@task_type), "post" do

      assert_select "input#task_type_name[name=?]", "task_type[name]"

      assert_select "textarea#task_type_setup[name=?]", "task_type[setup]"

      assert_select "textarea#task_type_teardown[name=?]", "task_type[teardown]"
    end
  end
end
