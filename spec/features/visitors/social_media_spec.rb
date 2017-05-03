require 'rails_helper'

# Feature: Social media links
#   As a visitor
#   I want to see social media links
#   So I can find Facebook, Titter, Youtube, Google+ pages
feature 'Social Media links', :devise do

  # Scenario: View social media links
  #   Given I am a visitor
  #   When I visit the home page
  #   Then I see "facebook," "twitter," "Youtube," and "google+"
  scenario 'view social media links' do
    visit root_path
    expect(page).to have_link 'facebook'
    expect(page).to have_link 'twitter'
    expect(page).to have_link 'Youtube'
    expect(page).to have_link 'google+'
  end
end
