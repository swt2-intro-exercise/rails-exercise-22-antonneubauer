describe Author, type: :model do
  it 'should create new instance of author' do
    first_name = 'Alan'
    last_name = 'Turing'
    homepage = 'http://wikipedia.org/Alan_Turing'
    author = Author.new(first_name: first_name, last_name: last_name, homepage: homepage)
    expect(author.first_name).to eq(first_name)
    expect(author.last_name).to eq(last_name)
    expect(author.homepage).to eq(homepage)
  end

  it '.name should return the full name' do
    first_name = 'Alan'
    last_name = 'Turing'
    homepage = ''
    author = Author.new(first_name: first_name, last_name: last_name, homepage: homepage)
    expect(author.name).to eq(first_name + ' ' + last_name)
  end

  it 'should not validate with a lastname shorter than 1 char' do
    @invalid_alan = FactoryBot.create :invalide_author
    expect(@invalid_alan).to_not be_valid
  end
end
