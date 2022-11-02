require 'rails_helper'

describe "New author page", type: :feature do
  it "should exist at 'new_author_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit new_author_path
  end
  
  it "should check for input fields for first_name, last_name and homepage at 'new_author_path'" do
    visit new_author_path
    expect(page).to have_field('authors[first_name]')
    expect(page).to have_field('authors[last_name]')
    expect(page).to have_field('authors[homepage]')
  end
end
