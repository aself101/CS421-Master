# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tbl_transfer_course do
    transferID "MyString"
    transfer_course_alpha "MyString"
    transfer_course_num "MyString"
    course_title "MyString"
    transfer_inst_name "MyString"
    transfer_hours 1
    effective_term "MyString"
    grp "MyString"
  end
end
