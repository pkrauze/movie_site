require 'rails_helper'
include Warden::Test::Helpers

describe 'Movie CRUD actions' do
  let(:user) { create(:user) }
  let(:director ) { create(:director) }
  let(:genre) { create(:genre) }
  let(:movie) { create(:movie, director_id: director.id, genre_ids: genre.id) }
  
  describe 'Logged user as admin is' do
    before { login_as(user, :scope => :user) }

    after { Warden.test_reset! }
    
    scenario 'creating movie' do
      before_count = Notification.count
      visit '/'
      click_link 'New Movie'
      fill_in 'movie[title]', with: 'Duszek'
      fill_in 'Desc', with: 'Movie about funny ghost'
      fill_in 'Year', with: '2017'
      fill_in 'Time', with: '105'
      fill_in 'Price', with: '12'
      select "David F.", from: "movie[director_id]"
      select "Horror", from: "movie[genre_ids][]"
      page.attach_file('movie[covers][]', Rails.root + 'spec/fixtures/duszek.png')
  
      expect{ click_button 'Create Movie'}.to change(Movie,:count).by(1)
                                          .and change(Notification, :count).by(2)
    end
    
    scenario 'destroying movie' do
      visit "/movies/#{movie.id}"
  
      expect { click_link('Destroy') }.to change(Movie, :count).by(-1)
    end
    
    scenario 'editing movie' do
      visit "/movies/#{movie.id}"
    
      click_link 'Edit'
      fill_in 'Title', with: 'Ghost'
      click_button 'Update Movie'
      
      expect(page).to have_content('Ghost')
    end
  end

  describe 'Not logged user is trying to' do
    scenario 'see create movie link' do
      visit '/'
      
      expect(page).not_to have_selector(:link_or_button, 'New Movie')
    end
    
    scenario 'create movie' do
      visit '/movies/new'
      
      expect(page).not_to have_selector(:button, 'Create Movie')
    end
    
    scenario 'see crud movie links' do
      visit "/movies/#{movie.id}"
      
      expect(page).not_to have_selector(:link_or_button, 'Destroy')
      expect(page).not_to have_selector(:link_or_button, 'Edit')
    end
    
    scenario 'edit movie' do
      visit "/movies/#{movie.id}/edit"
      
      expect(page).to have_current_path(root_path)
    end
  end
end