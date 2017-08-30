FactoryGirl.define do
  
  factory :subscriber do
    genre_id 1
    director_id 1
  end
  
  factory :user do
    email "testee@gmail.com"
    password "foobar"
    password_confirmation "foobar"
    confirmed_at Time.now
    
    after(:create) do |user|
      user.add_role(:admin)
      create_list(:subscriber, 1, user: user)
    end
  end
  
  factory :genre do
    name "Horror"
  end
  
  factory :director do
    firstname "Adam"
    lastname "Sandler"
  end
  
  factory :movie do
    title "Duszek"
    desc "Movie about funny ghost"
  end
end