require 'rails_helper'

RSpec.describe "formulas/edit", type: :view do
  before(:each) do
    @formula = assign(:formula, Formula.create!(
      :name => "MyString",
      :description => "MyString",
      :task => ""
    ))
  end

  it "renders the edit formula form" do
    render

    assert_select "form[action=?][method=?]", formula_path(@formula), "post" do

      assert_select "input#formula_name[name=?]", "formula[name]"

      assert_select "input#formula_description[name=?]", "formula[description]"

      assert_select "input#formula_task[name=?]", "formula[task]"
    end
  end
end
