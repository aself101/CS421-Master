require 'spec_helper'

describe "tbl_transfer_courses/index" do
  before(:each) do
    assign(:tbl_transfer_courses, [
      stub_model(TblTransferCourse,
        :transferID => "Transfer",
        :transfer_course_alpha => "Transfer Course Alpha",
        :transfer_course_num => "Transfer Course Num",
        :course_title => "Course Title",
        :transfer_inst_name => "Transfer Inst Name",
        :transfer_hours => 1,
        :effective_term => "Effective Term",
        :grp => "Grp"
      ),
      stub_model(TblTransferCourse,
        :transferID => "Transfer",
        :transfer_course_alpha => "Transfer Course Alpha",
        :transfer_course_num => "Transfer Course Num",
        :course_title => "Course Title",
        :transfer_inst_name => "Transfer Inst Name",
        :transfer_hours => 1,
        :effective_term => "Effective Term",
        :grp => "Grp"
      )
    ])
  end

  it "renders a list of tbl_transfer_courses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Transfer".to_s, :count => 2
    assert_select "tr>td", :text => "Transfer Course Alpha".to_s, :count => 2
    assert_select "tr>td", :text => "Transfer Course Num".to_s, :count => 2
    assert_select "tr>td", :text => "Course Title".to_s, :count => 2
    assert_select "tr>td", :text => "Transfer Inst Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Effective Term".to_s, :count => 2
    assert_select "tr>td", :text => "Grp".to_s, :count => 2
  end
end
