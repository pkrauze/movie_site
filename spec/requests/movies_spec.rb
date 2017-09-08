require 'rails_helper'

describe 'Movie requests' do
	describe 'The movie index page' do 
		before { create_list(:movie, 15) }

		it "displays 10 movies per page" do
			visit(root_path)
			expect(page).to have_content('Duszek10')
		end
	end	
end