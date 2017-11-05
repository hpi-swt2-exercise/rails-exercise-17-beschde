require 'rails_helper'

describe 'New author page', type: :feature do
  it 'should render without error' do
    visit new_author_path
  end

  context 'once rendered' do
    before :each do
      visit new_author_path
    end

    it "should display 'New Author'" do
      expect(page).to have_text('New Author')
    end

    it_should_behave_like 'an author form'

    it 'should save the new author' do
      fill_in 'First name', with: 'Alan'
      fill_in 'Last name', with: 'Turing'
      fill_in 'Homepage', with: 'http://wikipedia.org/Alan_Turing'
      submit_form

      author = Author.find_by(first_name: 'Alan', last_name: 'Turing', homepage: 'http://wikipedia.org/Alan_Turing')

      expect(author).to_not be_nil
    end
  end
end
