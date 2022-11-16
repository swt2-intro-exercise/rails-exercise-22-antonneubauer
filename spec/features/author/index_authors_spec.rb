require 'rails_helper'

describe 'Show author index page', type: :feature do
  it "should exist at 'authors_path' and render without error" do
    author_one = FactoryBot.create :author
    author_two = FactoryBot.create :author
    visit authors_path

    expect(page).to have_selector('table tr th', text: 'Name')
    expect(page).to have_selector('table tr th', text: 'Homepage')

    expect(page).to have_text(author_one.name)
    expect(page).to have_text(author_one.homepage)
    expect(page).to have_link('Show', href: author_path(author_one))
    expect(page).to have_link('Edit', href: edit_author_path(author_one))
    expect(page).to have_link('Delete', href: author_path(author_one))
    expect(page).to have_text(author_two.name)
    expect(page).to have_text(author_two.homepage)
    expect(page).to have_link('Show', href: author_path(author_two))
    expect(page).to have_link('Edit', href: edit_author_path(author_two))
    expect(page).to have_link('Delete', href: author_path(author_two))

    expect(page).to have_link('New', href: new_author_path)
  end

  it "should allow to delete an author" do
    an_author = FactoryBot.create :author
    visit authors_path

    count = Author.count
    find('a[data-turbo-method="delete"][href="' + author_path(an_author) + '"]').click
    expect(Author.count).to eq(count - 1)
  end
end
