FactoryGirl.define do
  factory :User do
    first_name     "Alexander"
    middle_initial    "D"
    last_name       "Self"
    email           "aself@hawaii.edu"
    password        "okstory"
    password_confirmation "okstory"
  end
end