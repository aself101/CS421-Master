require 'spec_helper'

describe "submissions/edit" do
  before(:each) do
    @submission = assign(:submission, stub_model(Submission,
      :name => "MyString",
      :student_id_number => "MyString",
      :classification => "MyString",
      :major => "MyString",
      :address => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :transfer_institution => "MyString",
      :term => "MyString",
      :course_alpha => "MyString",
      :course_number => "MyString",
      :course_hours => 1
    ))
  end

  it "renders the edit submission form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", submission_path(@submission), "post" do
      assert_select "input#submission_name[name=?]", "submission[name]"
      assert_select "input#submission_student_id_number[name=?]", "submission[student_id_number]"
      assert_select "input#submission_classification[name=?]", "submission[classification]"
      assert_select "input#submission_major[name=?]", "submission[major]"
      assert_select "input#submission_address[name=?]", "submission[address]"
      assert_select "input#submission_email[name=?]", "submission[email]"
      assert_select "input#submission_phone[name=?]", "submission[phone]"
      assert_select "input#submission_transfer_institution[name=?]", "submission[transfer_institution]"
      assert_select "input#submission_term[name=?]", "submission[term]"
      assert_select "input#submission_course_alpha[name=?]", "submission[course_alpha]"
      assert_select "input#submission_course_number[name=?]", "submission[course_number]"
      assert_select "input#submission_course_hours[name=?]", "submission[course_hours]"
    end
  end
end
