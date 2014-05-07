require 'spec_helper'

describe "tbl_transfer_courses/edit" do
  before(:each) do
    @tbl_transfer_course = assign(:tbl_transfer_course, stub_model(TblTransferCourse,
      :transferID => "MyString",
      :transfer_course_alpha => "MyString",
      :transfer_course_num => "MyString",
      :course_title => "MyString",
      :transfer_inst_name => "MyString",
      :transfer_hours => 1,
      :effective_term => "MyString",
      :grp => "MyString"
    ))
  end

  it "renders the edit tbl_transfer_course form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tbl_transfer_course_path(@tbl_transfer_course), "post" do
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
