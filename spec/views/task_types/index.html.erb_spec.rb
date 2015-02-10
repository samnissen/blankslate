require 'rails_helper'

RSpec.describe "task_types/index", type: :view do
  before(:each) do
    assign(:task_types, [
      TaskType.create!(
        :name => "Name",
        :setup => "MyText",
        :teardown => "MyText"
      ),
      TaskType.create!(
        :name => "Name",
        :setup => "MyText",
        :teardown => "MyText"
      )
    ])
  end

  it "renders a list of task_types" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
