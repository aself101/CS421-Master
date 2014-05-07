require 'spec_helper'

describe "tbl_equivalent_courses/show" do
  before(:each) do
    @tbl_equivalent_course = assign(:tbl_equivalent_course, stub_model(TblEquivalentCourse,
      :transferID => "Transfer",
      :approvalID => "Approval",
      :eq_course_alpha => "Eq Course Alpha",
      :eq_course_num => "Eq Course Num",
      :course_title => "Course Title",
      :eq_hours => 1,
      :conn => "Conn",
      :uhh_atr => "Uhh Atr",
      :pr => "Pr"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Transfer/)
    rendered.should match(/Approval/)
    rendered.should match(/Eq Course Alpha/)
    rendered.should match(/Eq Course Num/)
    rendered.should match(/Course Title/)
    rendered.should match(/1/)
    rendered.should match(/Conn/)
    rendered.should match(/Uhh Atr/)
    rendered.should match(/Pr/)
  end
end
