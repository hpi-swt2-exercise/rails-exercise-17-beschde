require 'rspec'

describe 'Author page', type: :feature do

  before :all do
    @alan = create(:author)
  end

  it 'should render without error' do
    visit author_path(@alan)
  end

  context 'once rendered' do
    before :each do
      visit author_path(@alan)
    end

    it 'should display author name in header' do
      expect(page).to have_xpath("//h1[contains(., 'Alan Turing')]")
    end

    it 'should display author details' do
      expect(page).to have_text('First name: Alan')
      expect(page).to have_text('Last name: Turing')
      expect(page).to have_text('Homepage: http://wikipedia.de/Alan_Turing')
    end
  end

  after :all do
    Author.destroy_all
  end
end