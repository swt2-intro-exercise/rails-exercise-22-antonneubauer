describe 'edit author page', type: :feature do
  it "should exist at 'edit_author_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    an_author = FactoryBot.create :author
    visit edit_author_path(an_author)
  end

  it "should check for input fields for first_name, last_name and homepage at 'edit_author_path'" do
    an_author = FactoryBot.create :author
    visit edit_author_path(an_author)
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end

  it 'should allow to update an author' do
    an_author = FactoryBot.create :author
    visit edit_author_path(an_author)
    new_first = 'Blan'
    new_last = 'Turning'
    new_homepage = 'notwikipeadia.com'

    fill_in 'author[first_name]', with: new_first
    fill_in 'author[last_name]', with: new_last
    fill_in 'author[homepage]', with: new_homepage
    click_button 'Update Author'

    an_author.reload
    expect(an_author.first_name).to eq(new_first)
    expect(an_author.last_name).to eq(new_last)
    expect(an_author.homepage).to eq(new_homepage)
  end

  it 'should not allow you to submit with a blank last name' do
    an_author = FactoryBot.create :author
    visit edit_author_path(an_author)
    new_first = 'Blan'
    new_last = ''
    new_homepage = 'notwikipeadia.com'

    fill_in 'author[first_name]', with: new_first
    fill_in 'author[last_name]', with: new_last
    fill_in 'author[homepage]', with: new_homepage
    click_button 'Update Author'

    an_author.reload
    expect(page).to have_text("Last name can't be blank")
  end
end
