require 'rails_helper'

RSpec.describe "task_types/show", type: :view do
  before(:each) do
    @task_type = assign(:task_type, TaskType.create!(
      :name => "Name",
      :setup => "MyText",
      :teardown => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
