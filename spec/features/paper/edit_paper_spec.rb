require 'rails_helper'

describe 'Edit paper page', type: :feature do

  before :all do
    @paper = create(:paper)
    @alan = @paper.authors.first
    @peter = create(:author, first_name: 'Peter', last_name: 'Plagiarist')
  end

  it 'should render without error' do
    visit edit_paper_path(@paper)
  end

  context 'once rendered' do
    before :each do
      visit edit_paper_path(@paper)
    end

    it_should_behave_like 'a paper form'

    it 'should save changes to the paper details' do
      fill_in 'Title', with: 'Intelligent machinery'
      fill_in 'Venue', with: 'Oxford University Press'
      fill_in 'Year', with: '1948'
      submit_form

      @paper.reload
      expect(@paper.title).to eq('Intelligent machinery')
      expect(@paper.venue).to eq('Oxford University Press')
      expect(@paper.year).to eq(1948)
    end

    it 'should save changes to the papers authors' do
      select(@peter.name, from: 'Author 1')
      submit_form

      @paper.reload
      expect(@paper.authors).to contain_exactly(@peter)
    end
  end

  after :all do
    Paper.destroy_all
    Author.destroy_all
  end
end
