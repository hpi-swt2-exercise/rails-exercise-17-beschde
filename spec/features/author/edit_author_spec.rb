require 'rails_helper'

describe 'Author edit page', type: :feature do

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
  end

  after :all do
    Author.destroy_all
  end
end
