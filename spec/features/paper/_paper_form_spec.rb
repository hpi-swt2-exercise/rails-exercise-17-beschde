require 'rails_helper'

shared_examples 'a paper form' do
  it 'should have text input for title, venue, and year' do
    expect(page).to have_field('Title')
    expect(page).to have_field('Venue')
    expect(page).to have_field('Year')
  end

  it 'should have a submit button' do
    expect(page).to have_css('input[type=submit]')
  end

  it 'should link back to the paper index page' do
    expect(page).to have_link('Back', href: papers_path)
  end
end
