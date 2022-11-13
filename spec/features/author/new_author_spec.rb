require 'rails_helper'

describe 'New author page', type: :feature do
  it "should exist at 'new_author_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit new_author_path
  end

  it "should check for input fields for first_name, last_name and homepage at 'new_author_path'" do
    visit new_author_path
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end

  it 'should display an error when an invalid author is supposed to be created' do
    visit new_author_path
    fill_in 'author[first_name]', with: 'Alan'
    fill_in 'author[homepage]', with: 'http://wikipedia.org/Alan_Turing'
    click_button 'Save Author'
    expect(page).to have_text("Last name can't be blank")
  end
end
