FactoryGirl.define do
  factory :user do
    email "test@gmail.com"
    password "foobar"
    password_confirmation "foobar"
    add_role :admin
  end
  
  factory :movie do
    title "Duszek"
    desc "Movie about funny ghost"
  end
end