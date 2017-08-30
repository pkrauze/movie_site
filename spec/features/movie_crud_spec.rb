require 'rails_helper'

describe 'Movie CRUD actions' do
  let(:user) { user = FactoryGirl.create(:user) }
  let(:movie) { movie = FactoryGirl.create(:movie) }
  
  describe 'Logged user as admin is' do
    before do
      visit '/users/sign_in'
      fill_in "Email",    with: user.email
      fill_in "Password", with: user.password
      click_button "Log in"
    end
    
    scenario 'creating movie' do
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
  
      click_button 'Create Movie'
      
      expect(page).to have_content('Duszek')
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