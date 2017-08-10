require 'rails_helper'

describe Movie do
  context "When testing the movie class" do
    it "should create the new movie" do
      m = Movie.new
      m.title = "Avengers"
      m.save
      
      expect(m.title).to eq("Avengers")
    end
  end
end