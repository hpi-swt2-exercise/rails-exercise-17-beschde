require 'rails_helper'

describe Author, type: :model do
  before :each do
    @author = Author.new(first_name: 'Alan', last_name: 'Turing', homepage: 'https://en.wikipedia.org/wiki/Alan_Turing')
  end

  context 'once created' do
    it 'should not be valid without a last name' do
      author = Author.new(first_name: 'Alan', homepage: 'https://en.wikipedia.org/wiki/Alan_Turing')
      expect(author).to_not be_valid
    end

    it 'should not be valid with an empty last name' do
      author = Author.new(first_name: 'Alan', last_name: '', homepage: 'https://en.wikipedia.org/wiki/Alan_Turing')
      expect(author).to_not be_valid
    end
  end

  it 'should have a first name, last name and homepage' do
    expect(@author.first_name).to eq('Alan')
    expect(@author.last_name).to eq('Turing')
    expect(@author.homepage).to eq('https://en.wikipedia.org/wiki/Alan_Turing')
  end

  it 'should have an initially empty list of papers' do
    expect(@author.papers).to_not be_nil
    expect(@author.papers).to be_empty
    expect(@author.papers).to eq([])
  end

  it 'should return the full name on #name' do
    expect(@author.name).to eq('Alan Turing')
  end
end
