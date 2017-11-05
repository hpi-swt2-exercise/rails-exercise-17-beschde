require 'rails_helper'

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
      expect(page).to have_text('Homepage: https://en.wikipedia.org/wiki/Alan_Turing')
    end

    it 'should link back to the authors edit page' do
      expect(page).to have_link('Edit', href: edit_author_path(@alan))
    end

    it 'should have a link to delete that author' do
      expect(page).to have_css("a[href='#{author_path(@alan)}'][method=delete]")
    end

    it 'should link back to the author index page' do
      expect(page).to have_link('Back', href: authors_path)
    end
  end

  after :all do
    Author.destroy_all
  end
end
