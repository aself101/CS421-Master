require 'spec_helper'

describe "tbl_transfer_courses/show" do
  before(:each) do
    @tbl_transfer_course = assign(:tbl_transfer_course, stub_model(TblTransferCourse,
      :transferID => "Transfer",
      :transfer_course_alpha => "Transfer Course Alpha",
      :transfer_course_num => "Transfer Course Num",
      :course_title => "Course Title",
      :transfer_inst_name => "Transfer Inst Name",
      :transfer_hours => 1,
      :effective_term => "Effective Term",
      :grp => "Grp"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Transfer/)
    rendered.should match(/Transfer Course Alpha/)
    rendered.should match(/Transfer Course Num/)
    rendered.should match(/Course Title/)
    rendered.should match(/Transfer Inst Name/)
    rendered.should match(/1/)
    rendered.should match(/Effective Term/)
    rendered.should match(/Grp/)
  end
end
