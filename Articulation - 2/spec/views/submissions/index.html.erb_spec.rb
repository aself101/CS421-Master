require 'spec_helper'

describe "submissions/index" do
  before(:each) do
    assign(:submissions, [
      stub_model(Submission,
        :name => "Name",
        :student_id => "Student",
        :classification => "Classification",
        :major => "Major",
        :address => "Address",
        :email => "Email",
        :phone => "Phone",
        :transfer institution => "Transfer Institution",
        : => "",
        :term => "Term",
        :course alpha => "Course Alpha",
        : => "",
        :course number => "Course Number",
        : => "",
        :course hours => "Course Hours",
        : => 1,
        :uh hilo equivalent => "Uh Hilo Equivalent",
        : => ""
      ),
      stub_model(Submission,
        :name => "Name",
        :student_id => "Student",
        :classification => "Classification",
        :major => "Major",
        :address => "Address",
        :email => "Email",
        :phone => "Phone",
        :transfer institution => "Transfer Institution",
        : => "",
        :term => "Term",
        :course alpha => "Course Alpha",
        : => "",
        :course number => "Course Number",
        : => "",
        :course hours => "Course Hours",
        : => 1,
        :uh hilo equivalent => "Uh Hilo Equivalent",
        : => ""
      )
    ])
  end

  it "renders a list of submissions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Student".to_s, :count => 2
    assert_select "tr>td", :text => "Classification".to_s, :count => 2
    assert_select "tr>td", :text => "Major".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Transfer Institution".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Term".to_s, :count => 2
    assert_select "tr>td", :text => "Course Alpha".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Course Number".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Course Hours".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Uh Hilo Equivalent".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
