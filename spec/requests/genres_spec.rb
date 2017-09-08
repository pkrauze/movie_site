require 'rails_helper'

include Warden::Test::Helpers

describe "Genre requests" do
	let!(:genre) { create(:genre) }
	let(:user) { create(:user) }

	describe "When user is on genres page" do
		it 'allows to see genres' do
			visit '/genres'

			expect(page).to have_content(genre.name)
		end
	end

	describe 'When user is logged in' do
		before { login_as(user, :scope => :user) }

    after { Warden.test_reset! }

		it 'allows to subscribe genre' do
			visit '/genres'

			expect{ click_link 'Subscribe'}.to change(Subscriber,:count).by(1)
		end

		it 'allows to Unsubscribe' do
			visit '/genres'
			click_link 'Subscribe'
			
			expect{ click_link 'Unsubscribe'}.to change(Subscriber,:count).by(-1)
		end

		it 'allows to see admin links' do
			visit '/genres'

			expect(page).to have_link('Edit').and have_link('Destroy')
		end

		it 'allows to create genre' do
			visit '/genres'
			click_link 'Create Genre'
			fill_in 'Name', with: "Comedy"

			expect{ click_button 'Create Genre'}.to change(Genre,:count).by(1)
		end

		it 'allows to edit genre' do
			visit "/genres/#{genre.id}"
			click_link 'Edit'
			fill_in 'genre[name]', with: "Comedy"
			click_button "Update Genre"

			expect(page).to have_content("Comedy")
		end

		it 'allows to destroy genre' do
			visit '/genres'

			expect{ click_link 'Destroy'}.to change(Genre,:count).by(-1)
		end
	end
end