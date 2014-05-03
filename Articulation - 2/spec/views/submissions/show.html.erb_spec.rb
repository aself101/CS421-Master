require 'spec_helper'

describe "submissions/show" do
  before(:each) do
    @submission = assign(:submission, stub_model(Submission,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Student/)
    rendered.should match(/Classification/)
    rendered.should match(/Major/)
    rendered.should match(/Address/)
    rendered.should match(/Email/)
    rendered.should match(/Phone/)
    rendered.should match(/Transfer Institution/)
    rendered.should match(//)
    rendered.should match(/Term/)
    rendered.should match(/Course Alpha/)
    rendered.should match(//)
    rendered.should match(/Course Number/)
    rendered.should match(//)
    rendered.should match(/Course Hours/)
    rendered.should match(/1/)
    rendered.should match(/Uh Hilo Equivalent/)
    rendered.should match(//)
  end
end
