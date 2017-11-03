require 'rails_helper'

describe 'New author page', type: :feature do
  it 'should render withour error' do
    visit new_author_path
  end

  context 'once rendered' do
    before :each do
      visit new_author_path
    end

    it "should display 'New Author'" do
      expect(page).to have_text('New Author')
    end

    it 'should have a form that can create an author' do
      expect(page).to have_css("form[action='#{authors_path}'][method=post]")
    end

    it 'should have text input for first name, last name, and homepage' do
      expect(page).to have_field('First name')
      expect(page).to have_field('Last name')
      expect(page).to have_field('Homepage')
    end

    it 'should have a submit button' do
      expect(page).to have_css("input[type=submit][value='Save Author']")
    end

    it 'should save the new author' do
      fill_in 'First name', with: 'Alan'
      fill_in 'Last name', with: 'Turing'
      fill_in 'Homepage', with: 'http://wikipedia.org/Alan_Turing'
      find('input[type=submit]').click

      author = Author.find_by(first_name: 'Alan', last_name: 'Turing', homepage: 'http://wikipedia.org/Alan_Turing')

      expect(author).to_not be_nil
    end
  end
end