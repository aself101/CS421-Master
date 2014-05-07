require 'spec_helper'

describe "tbl_equivalent_courses/index" do
  before(:each) do
    assign(:tbl_equivalent_courses, [
      stub_model(TblEquivalentCourse,
        :transferID => "Transfer",
        :approvalID => "Approval",
        :eq_course_alpha => "Eq Course Alpha",
        :eq_course_num => "Eq Course Num",
        :course_title => "Course Title",
        :eq_hours => 1,
        :conn => "Conn",
        :uhh_atr => "Uhh Atr",
        :pr => "Pr"
      ),
      stub_model(TblEquivalentCourse,
        :transferID => "Transfer",
        :approvalID => "Approval",
        :eq_course_alpha => "Eq Course Alpha",
        :eq_course_num => "Eq Course Num",
        :course_title => "Course Title",
        :eq_hours => 1,
        :conn => "Conn",
        :uhh_atr => "Uhh Atr",
        :pr => "Pr"
      )
    ])
  end

  it "renders a list of tbl_equivalent_courses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Transfer".to_s, :count => 2
    assert_select "tr>td", :text => "Approval".to_s, :count => 2
    assert_select "tr>td", :text => "Eq Course Alpha".to_s, :count => 2
    assert_select "tr>td", :text => "Eq Course Num".to_s, :count => 2
    assert_select "tr>td", :text => "Course Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Conn".to_s, :count => 2
    assert_select "tr>td", :text => "Uhh Atr".to_s, :count => 2
    assert_select "tr>td", :text => "Pr".to_s, :count => 2
  end
end
