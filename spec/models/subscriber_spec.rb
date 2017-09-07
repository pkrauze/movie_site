require 'rails_helper'

RSpec.describe Subscriber, type: :model do
  
  context "When testing subscriber class "  do
  
    it "should subscribe director by user" do
      u = User.find_by(id: 1)
      d = Director.find_by(id: 1)
      Subscriptions::Subscribe.new(u,d.id).call
      
      s = Subscriber.find_by(user_id: u.id, director_id: d.id)
      expect(s).not_to be_empty
    end
    
    it "should unsubscribe director by user" do
      u = User.find_by(id: 1)
      d = Director.find_by(id: 1)
      Subscriptions::Unsubscribe.new(u,d.id).call
      
      s = Subscriber.find_by(user_id: u.id, director_id: d.id)
      expect(s).to be_empty
    end
    
  end
  pending "add some examples to (or delete) #{__FILE__}"
end
