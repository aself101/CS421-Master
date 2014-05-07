require 'spec_helper'

describe "tbl_equivalent_courses/new" do
  before(:each) do
    assign(:tbl_equivalent_course, stub_model(TblEquivalentCourse,
      :transferID => "MyString",
      :approvalID => "MyString",
      :eq_course_alpha => "MyString",
      :eq_course_num => "MyString",
      :course_title => "MyString",
      :eq_hours => 1,
      :conn => "MyString",
      :uhh_atr => "MyString",
      :pr => "MyString"
    ).as_new_record)
  end

  it "renders new tbl_equivalent_course form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tbl_equivalent_courses_path, "post" do
      assert_select "input#tbl_equivalent_course_transferID[name=?]", "tbl_equivalent_course[transferID]"
      assert_select "input#tbl_equivalent_course_approvalID[name=?]", "tbl_equivalent_course[approvalID]"
      assert_select "input#tbl_equivalent_course_eq_course_alpha[name=?]", "tbl_equivalent_course[eq_course_alpha]"
      assert_select "input#tbl_equivalent_course_eq_course_num[name=?]", "tbl_equivalent_course[eq_course_num]"
      assert_select "input#tbl_equivalent_course_course_title[name=?]", "tbl_equivalent_course[course_title]"
      assert_select "input#tbl_equivalent_course_eq_hours[name=?]", "tbl_equivalent_course[eq_hours]"
      assert_select "input#tbl_equivalent_course_conn[name=?]", "tbl_equivalent_course[conn]"
      assert_select "input#tbl_equivalent_course_uhh_atr[name=?]", "tbl_equivalent_course[uhh_atr]"
      assert_select "input#tbl_equivalent_course_pr[name=?]", "tbl_equivalent_course[pr]"
    end
  end
end
