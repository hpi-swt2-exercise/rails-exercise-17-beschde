require 'rails_helper'

shared_examples 'a paper form' do
  it 'should have text input for title, venue, and year' do
    expect(page).to have_field('Title')
    expect(page).to have_field('Venue')
    expect(page).to have_field('Year')
  end

  context 'should show validation errors' do
    before :each do
      fill_in 'Title', with: 'A paper'
      fill_in 'Venue', with: 'A venue'
      fill_in 'Year', with: '2017'
    end

    it 'when the title is empty' do
      fill_in 'Title', with: ''
      find('input[type=submit]').click

      expect(page).to have_text("Title can't be blank")
    end

    it 'when the venue is empty' do
      fill_in 'Venue', with: ''
      find('input[type=submit]').click

      expect(page).to have_text("Venue can't be blank")
    end

    it 'when the year is empty' do
      fill_in 'Year', with: ''
      find('input[type=submit]').click

      expect(page).to have_text("Year can't be blank")
    end

    it 'when the year is not a number' do
      fill_in 'Year', with: 'a year'
      find('input[type=submit]').click

      expect(page).to have_text('Year is not a number')
    end

    it 'when the year is negative' do
      fill_in 'Year', with: '-2017'
      find('input[type=submit]').click

      expect(page).to have_text('Year must be greater than or equal to 0')
    end

    it 'when the year is not an integer' do
      fill_in 'Year', with: '2017.42'
      find('input[type=submit]').click

      expect(page).to have_text('Year must be an integer')
    end
  end

  it 'should have a submit button' do
    expect(page).to have_css('input[type=submit]')
  end

  it 'should link back to the paper index page' do
    expect(page).to have_link('Back', href: papers_path)
  end
end
