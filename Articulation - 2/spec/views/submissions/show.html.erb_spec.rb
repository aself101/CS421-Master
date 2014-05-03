require 'spec_helper'

describe "submissions/show" do
  before(:each) do
    @submission = assign(:submission, stub_model(Submission,
      :name => "Name",
      :student_id_number => "Student Id Number",
      :classification => "Classification",
      :major => "Major",
      :address => "Address",
      :email => "Email",
      :phone => "Phone",
      :transfer_institution => "Transfer Institution",
      :term => "Term",
      :course_alpha => "Course Alpha",
      :course_number => "Course Number",
      :course_hours => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Student Id Number/)
    rendered.should match(/Classification/)
    rendered.should match(/Major/)
    rendered.should match(/Address/)
    rendered.should match(/Email/)
    rendered.should match(/Phone/)
    rendered.should match(/Transfer Institution/)
    rendered.should match(/Term/)
    rendered.should match(/Course Alpha/)
    rendered.should match(/Course Number/)
    rendered.should match(/1/)
  end
end
