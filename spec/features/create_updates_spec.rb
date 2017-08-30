require 'rails_helper'

feature 'Creating Updates' do
  scenario 'can create movie' do
    visit '/'
    click_link 'New Movie'
    fill_in 'movie[title]', with: 'Duszek'
    fill_in 'Desc', with: 'Movie about funny ghost'
    fill_in 'Year', with: '2017'
    fill_in 'Time', with: '105'
    fill_in 'Price', with: '12'
    select "Adam", from: "movie[director_id]"
    select "Comedy", from: "movie[genre_ids][]"
    page.attach_file('movie[covers][]', Rails.root + 'spec/fixtures/duszek.png')
    
    click_button 'Create Movie'
    expect(page).to have_content('Duszek')
  end
end