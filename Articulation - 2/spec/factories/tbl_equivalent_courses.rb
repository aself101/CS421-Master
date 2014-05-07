# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tbl_equivalent_course do
    transferID "MyString"
    approvalID "MyString"
    eq_course_alpha "MyString"
    eq_course_num "MyString"
    course_title "MyString"
    eq_hours 1
    conn "MyString"
    uhh_atr "MyString"
    pr "MyString"
  end
end
