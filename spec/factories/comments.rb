# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    content ""
    user_id ""
    activity_id 1
  end
end
