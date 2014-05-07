require 'spec_helper'

describe "tbl_transfer_courses/new" do
  before(:each) do
    assign(:tbl_transfer_course, stub_model(TblTransferCourse,
      :transferID => "MyString",
      :transfer_course_alpha => "MyString",
      :transfer_course_num => "MyString",
      :course_title => "MyString",
      :transfer_inst_name => "MyString",
      :transfer_hours => 1,
      :effective_term => "MyString",
      :grp => "MyString"
    ).as_new_record)
  end

  it "renders new tbl_transfer_course form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tbl_transfer_courses_path, "post" do
      assert_select "input#tbl_transfer_course_transferID[name=?]", "tbl_transfer_course[transferID]"
      assert_select "input#tbl_transfer_course_transfer_course_alpha[name=?]", "tbl_transfer_course[transfer_course_alpha]"
      assert_select "input#tbl_transfer_course_transfer_course_num[name=?]", "tbl_transfer_course[transfer_course_num]"
      assert_select "input#tbl_transfer_course_course_title[name=?]", "tbl_transfer_course[course_title]"
      assert_select "input#tbl_transfer_course_transfer_inst_name[name=?]", "tbl_transfer_course[transfer_inst_name]"
      assert_select "input#tbl_transfer_course_transfer_hours[name=?]", "tbl_transfer_course[transfer_hours]"
      assert_select "input#tbl_transfer_course_effective_term[name=?]", "tbl_transfer_course[effective_term]"
      assert_select "input#tbl_transfer_course_grp[name=?]", "tbl_transfer_course[grp]"
    end
  end
end
