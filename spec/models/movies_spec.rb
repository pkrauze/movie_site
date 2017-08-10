require 'rails_helper'

describe Movie do
  context "When testing the movie class" do
    it "should create the new movie" do
      m = Movie.new
      m.title = "Avengers"
      m.save
      
      expect(m.title).to eq("Avengers")
    end
    
    it "should update the last movie" do
      m = Movie.new
      m.title = "Avengers"
      m.save
      
      m.update(title:"Indiana Jones")
      
      expect(m.title).to eq("Indiana Jones")
    end

  end
end