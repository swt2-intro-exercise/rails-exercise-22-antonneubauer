require 'rails_helper'

RSpec.describe "papers/index", type: :feature do
  # before(:each) do
  #   assign(:papers, [
  #     Paper.create!(
  #       title: "Title",
  #       venue: "Venue",
  #       year: 2
  #     ),
  #     Paper.create!(
  #       title: "Title",
  #       venue: "Venue",
  #       year: 2
  #     )
  #   ])
  # end

  it "should exist at 'papers_path' and render without error" do
    paper_one = FactoryBot.create :paper
    paper_two = FactoryBot.create :paper
    visit papers_path

    expect(page).to have_selector('table tr th', text: 'Title')
    expect(page).to have_selector('table tr th', text: 'Venue')
    expect(page).to have_selector('table tr th', text: 'Year')

    expect(page).to have_text(paper_one.title)
    expect(page).to have_text(paper_one.venue)
    expect(page).to have_text(paper_one.year)
    expect(page).to have_link('Show', href: paper_path(paper_one))
    expect(page).to have_link('Edit', href: edit_paper_path(paper_one))
    expect(page).to have_link('Delete', href: paper_path(paper_one))
    expect(page).to have_text(paper_two.title)
    expect(page).to have_text(paper_two.venue)
    expect(page).to have_text(paper_one.year)
    expect(page).to have_link('Show', href: paper_path(paper_two))
    expect(page).to have_link('Edit', href: edit_paper_path(paper_two))
    expect(page).to have_link('Delete', href: paper_path(paper_two))

    expect(page).to have_link('New', href: new_paper_path)
  end

  it "renders a link to the show, edit, delete page of a paper" do
    a_paper = FactoryBot.create :paper
    visit papers_path
    
    expect(page).to have_link('Show', href: paper_path(a_paper))
    expect(page).to have_link('Edit', href: edit_paper_path(a_paper))
    expect(page).to have_link('Delete', href: paper_path(a_paper))
  end
end
