FactoryGirl.define do
  factory :user do
    sequence(:username)  { |n| "Person #{n}" }
   sequence(:email) { |n| "person_#{n}@example.com"}
    name 'nooralam'
    #username 'noor'
   # email 'nooralam@gmail.com'
    password "foobarcom"
    password_confirmation "foobarcom"
 end
 factory :activity do
    category "Sports"
    name "cricket"
    description "hi"
    
    user
  end
 
end