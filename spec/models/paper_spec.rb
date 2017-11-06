require 'rails_helper'

describe Paper, type: :model do
  before :each do
    @paper = build(:paper)
  end

  context 'once created' do
    it 'should not be valid without a title' do
      paper = Paper.new(venue: 'A venue', year: 2017)
      expect(paper).to_not be_valid
    end

    it 'should not be valid with an empty title' do
      paper = Paper.new(title: '', venue: 'A venue', year: 2017)
      expect(paper).to_not be_valid
    end

    it 'should not be valid without a venue' do
      paper = Paper.new(title: 'A paper', year: 2017)
      expect(paper).to_not be_valid
    end

    it 'should not be valid with an empty venue' do
      paper = Paper.new(title: 'A paper', venue: '', year: 2017)
      expect(paper).to_not be_valid
    end

    it 'should not be valid without a year' do
      paper = Paper.new(title: 'A paper', venue: 'A venue')
      expect(paper).to_not be_valid
    end

    it 'should not be valid with a non numerical year' do
      paper = Paper.new(title: 'A paper', venue: 'A venue', year: 'abacaba')
      expect(paper).to_not be_valid
    end

    it 'should not be valid with a non integer year' do
      paper = Paper.new(title: 'A paper', venue: 'A venue', year: 2017.15)
      expect(paper).to_not be_valid
    end

    it 'should not be valid with a negative year' do
      paper = Paper.new(title: 'A paper', venue: 'A venue', year: -2017)
      expect(paper).to_not be_valid
    end
  end

  it 'should have a title, venue and year' do
    paper = Paper.new(title: 'A paper', venue: 'A venue', year: 2017)
    expect(paper.title).to eq('A paper')
    expect(paper.venue).to eq('A venue')
    expect(paper.year).to eq(2017)
  end
end
