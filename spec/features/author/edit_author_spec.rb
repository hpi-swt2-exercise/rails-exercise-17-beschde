require 'rails_helper'

describe 'Edit author page', type: :feature do

  before :all do
    @alan = create(:author)
  end

  it 'should render without error' do
    visit edit_author_path(@alan)
  end

  context 'once rendered' do
    before :each do
      visit edit_author_path(@alan)
    end

    it 'should have text input for first name, last name, and homepage' do
      expect(page).to have_field('First name')
      expect(page).to have_field('Last name')
      expect(page).to have_field('Homepage')
    end

    it 'should have a submit button' do
      expect(page).to have_css('input[type=submit]')
    end

    it 'should save changes to the author details' do
      fill_in 'First name', with: 'Marie'
      fill_in 'Last name', with: 'Curie'
      fill_in 'Homepage', with: 'https://en.wikipedia.org/wiki/Marie_Curie'
      find('input[type=submit]').click

      marie = @alan.reload
      expect(marie.first_name).to eq('Marie')
      expect(marie.last_name).to eq('Curie')
      expect(marie.homepage).to eq('https://en.wikipedia.org/wiki/Marie_Curie')
    end

    it 'should show validation errors' do
      fill_in 'Last name', with: ''
      find('input[type=submit]').click

      expect(page).to have_text("Last name can't be blank")
    end

    it 'should link back to the author index page' do
      expect(page).to have_link('Back', href: authors_path)
    end
  end

  after :all do
    Author.destroy_all
  end
end
