require 'spec_helper'

describe "submissions/edit" do
  before(:each) do
    @submission = assign(:submission, stub_model(Submission,
      :name => "MyString",
      :student_id => "MyString",
      :classification => "MyString",
      :major => "MyString",
      :address => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :transfer institution => "MyString",
      : => "MyString",
      :term => "MyString",
      :course alpha => "MyString",
      : => "MyString",
      :course number => "MyString",
      : => "MyString",
      :course hours => "MyString",
      : => 1,
      :uh hilo equivalent => "MyString",
      : => "MyString"
    ))
  end

  it "renders the edit submission form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", submission_path(@submission), "post" do
      assert_select "input#submission_name[name=?]", "submission[name]"
      assert_select "input#submission_student_id[name=?]", "submission[student_id]"
      assert_select "input#submission_classification[name=?]", "submission[classification]"
      assert_select "input#submission_major[name=?]", "submission[major]"
      assert_select "input#submission_address[name=?]", "submission[address]"
      assert_select "input#submission_email[name=?]", "submission[email]"
      assert_select "input#submission_phone[name=?]", "submission[phone]"
      assert_select "input#submission_transfer institution[name=?]", "submission[transfer institution]"
      assert_select "input#submission_[name=?]", "submission[]"
      assert_select "input#submission_term[name=?]", "submission[term]"
      assert_select "input#submission_course alpha[name=?]", "submission[course alpha]"
      assert_select "input#submission_[name=?]", "submission[]"
      assert_select "input#submission_course number[name=?]", "submission[course number]"
      assert_select "input#submission_[name=?]", "submission[]"
      assert_select "input#submission_course hours[name=?]", "submission[course hours]"
      assert_select "input#submission_[name=?]", "submission[]"
      assert_select "input#submission_uh hilo equivalent[name=?]", "submission[uh hilo equivalent]"
      assert_select "input#submission_[name=?]", "submission[]"
    end
  end
end
