FactoryGirl.define do
  factory :admin_user do
    
  end
  
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
    name "Horror1"
  end
  
  factory :director do
    firstname "Adam"
    lastname "Sandler"
    year_of_birth 1975
  end
  
  sequence(:title) { |n| "Duszek#{n}" }

  factory :movie do
    title
    desc "Movie about funny ghost"
    year 2012
    time 123
    price 12
    director_id 1
  end
end