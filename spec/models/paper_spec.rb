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
    expect(a_paper).to be_valid
    expect(a_paper.title).to eq(title)
    expect(a_paper.venue).to eq(venue)
    expect(a_paper.year).to eq(year)
  end

  it 'should not validate without a title, year has to be a numeric value' do
    title = 'Title1'
    venue = 'venue1'
    year = 1900
    invalid_paper_one = Paper.new(
      title: title,
      venue: venue
    )
    expect(invalid_paper_one).to_not be_valid

    invalid_paper_two = Paper.new(
      title: title,
      year: year
    )
    expect(invalid_paper_one).to_not be_valid

    invalid_paper_three = Paper.new(
      venue: venue,
      year: year
    )
    expect(invalid_paper_three).to_not be_valid

    invalid_paper_four = Paper.new(
      title: title,
      venue: venue,
      year: venue
    )
    expect(invalid_paper_three).to_not be_valid
  end
end
