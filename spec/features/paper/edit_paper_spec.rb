require 'rails_helper'

describe 'Edit paper page', type: :feature do

  before :all do
    @paper = create(:paper)
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

      im = @paper.reload
      expect(im.title).to eq('Intelligent machinery')
      expect(im.venue).to eq('Oxford University Press')
      expect(im.year).to eq(1948)
    end
  end

  after :all do
    Paper.destroy_all
    Author.destroy_all
  end
end
