require 'rails_helper'

describe Paper, type: :model do
  before :each do
    @paper = build(:paper)
  end

  it 'should have a title, venue and year' do
    paper = Paper.new(title: 'A paper', venue: 'A venue', year: 2017)
    expect(paper.title).to eq('A paper')
    expect(paper.venue).to eq('A venue')
    expect(paper.year).to eq(2017)
  end
end
