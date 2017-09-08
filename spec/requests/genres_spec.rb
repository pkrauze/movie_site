require 'rails_helper'

include Warden::Test:Helpers

describe "Genre requests" do
	let!(:genre) { create(:genre) }
	let(:user) { create(:user) }

	describe "When user is on genres page" do
		it 'allows to see genres' do
			visit(genres_path)

			expect(page).to have_content(genre.name)
		end
	end

	describe 'When user is logged in' do
		before { login_as(:user, :scope => :user) }

		it 'allows to subscribe genre' do
			visit(genres_path)

			expect{ click_link 'Subscribe'}.to change(Subscriber,:count).by(1)
		end

		it 'allows to Unsubscribe' do
			visit(genres_path)
			click_link 'Subscribe'

			expect{ click_link 'Unsubscribe'}.to change(Subscriber,:count).by(1)
		end

		it 'allows to see admin links' do
			visit(genres_path)

			expect(page).to have_link('Edit').and have_link('Destroy')
		end

		it 'allows to create genre' do
			
		end

		it 'allows to destroy genre' do
			
		end
	end
end