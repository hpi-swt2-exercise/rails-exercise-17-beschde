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

    it 'should have text input for title, venue, and year' do
      expect(page).to have_field('Title')
      expect(page).to have_field('Venue')
      expect(page).to have_field('Year')
    end

    it 'should have a submit button' do
      expect(page).to have_css('input[type=submit]')
    end

    it 'should save changes to the paper details' do
      fill_in 'Title', with: 'Intelligent machinery'
      fill_in 'Venue', with: 'Oxford University Press'
      fill_in 'Year', with: '1948'
      submit_form

      im = @paper.reload
      expect(im.first_name).to eq('Intelligent machinery')
      expect(im.last_name).to eq('Oxford University Press')
      expect(im.homepage).to eq('1948')
    end

    it 'should link back to the paper index page' do
      expect(page).to have_link('Back', href: papers_path)
    end
  end

  after :all do
    Paper.destroy_all
  end
end
