require 'rails_helper'

describe 'Author index page', type: :feature do
  it 'should render without error' do
    visit authors_path
  end

  context 'once rendered' do
    before :each do
      visit authors_path
    end

    it "should display 'Authors' in header" do
      expect(page).to have_xpath("//h1[contains(., 'Authors')]")
    end

    it 'should contain a table header' do
      expect(page).to have_xpath("//table/tr/th[contains(., 'Name')]")
      expect(page).to have_xpath("//table/tr/th[contains(., 'Homepage')]")
    end

    it 'should list authors in a table' do
      create(:author)
      visit authors_path
      expect(page).to have_xpath("//table/tr/td[contains(., 'Alan Turing')]")
      expect(page).to have_xpath("//table/tr/td[contains(., 'http://wikipedia.de/Alan_Turing')]")
    end
  end
end