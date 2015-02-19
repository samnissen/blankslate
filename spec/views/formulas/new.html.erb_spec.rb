require 'rails_helper'

RSpec.describe "formulas/new", type: :view do
  before(:each) do
    assign(:formula, Formula.new(
      :name => "MyString",
      :description => "MyString",
      :task => ""
    ))
  end

  it "renders new formula form" do
    render

    assert_select "form[action=?][method=?]", formulas_path, "post" do

      assert_select "input#formula_name[name=?]", "formula[name]"

      assert_select "input#formula_description[name=?]", "formula[description]"

      assert_select "input#formula_task[name=?]", "formula[task]"
    end
  end
end
