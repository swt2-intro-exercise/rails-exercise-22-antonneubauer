describe 'edit author page', type: :feature do
  it "should exist at 'edit_author_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    author = FactoryBot.create :author
    visit edit_author_path(author)
  end
end
