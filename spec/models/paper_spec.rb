require 'rails_helper'

describe Paper, type: :model do
  it 'should create a new instance of paper' do
    title = 'Title1'
    venue = 'venue1'
    year = 1900
    a_paper = Paper.new(
      title: title,
      venue: venue,
      year: year
    )
    expect(a_paper.title).to eq(title)
    expect(a_paper.venue).to eq(venue)
    expect(a_paper.year).to eq(year)
  end
end
