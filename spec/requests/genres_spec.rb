require 'rails_helper'

include Warden::Test:Helpers

describe "Genre requests" do
	let(:genre) { create(:genre) }
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

		end
	end
end