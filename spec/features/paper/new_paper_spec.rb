require 'rails_helper'

describe 'New paper page' do
  it 'should render without error' do
    visit new_paper_path
  end

  context 'once rendered' do
    before :each do
      visit new_paper_path
    end

    it_should_behave_like 'a paper form'

    it 'should save the new paper' do
      fill_in 'Title', with: 'A title'
      fill_in 'Venue', with: 'A venue'
      fill_in 'Year', with: '2017'
      submit_form

      paper = Paper.find_by(title: 'A title', venue: 'A venue', year: 2017)

      expect(paper).to_not be_nil
    end
  end
end
