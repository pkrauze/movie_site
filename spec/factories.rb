FactoryGirl.define do
  factory :user do
    email "testo@gmail.com"
    password "foobar"
    password_confirmation "foobar"
    confirmed_at Time.now
    
    after(:create) {|user| user.add_role(:admin)}
  end
  
  factory :movie do
    title "Duszek"
    desc "Movie about funny ghost"
  end
end