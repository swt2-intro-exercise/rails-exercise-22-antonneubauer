require 'rails_helper'

describe "New author page", type: :feature do
  it "should exist at 'new_author_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit new_author_path
  end
  it "should check for input fields for first-, lastname and Homepage at 'new_author_path'" do
    expect(page).to have_field('authors[first_name]')
    expect(page).to have_field('authors[last_name]')
    expect(page).to have_field('authors[homepage]')
  end
end
