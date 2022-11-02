require 'rails_helper'

describe "Show author index page", type: :feature do
    before :each do
        FactoryBot.create :author
        FactoryBot.create :author
        FactoryBot.create :author

        @all = Author.all
    end

    it "should exist at 'authors_path" do
        visit authors_path
    end

    it "should contain a table with headers name, homepage" do
        visit authors_path
        expect(page).to have_selector("table tr th", text: "Name")
        expect(page).to have_selector("table tr th", text: "Homepage")
    end

    it "should contain a table with the name, hompage for each author and link to the details page" do
        visit authors_path

        @all.each do |author|
            expect(page).to have_text(author.name)
            expect(page).to have_text(author.homepage)
            expect(page).to have_link("Show", href: author_path(author))
        end
    end

    it "should contain a link to create a new author" do
        visit authors_path
        expect(page).to have_link("New", href: new_author_path)
    end
end
