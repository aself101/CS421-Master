# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tbl_institution do
    institution_name "MyString"
    city "MyString"
    state "MyString"
    zip 1
    website "MyString"
  end
end
