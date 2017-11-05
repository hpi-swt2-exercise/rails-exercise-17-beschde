require 'rails_helper'

shared_examples 'an author form' do
  it 'should have text input for first name, last name, and homepage' do
    expect(page).to have_field('First name')
    expect(page).to have_field('Last name')
    expect(page).to have_field('Homepage')
  end

  it 'should have a submit button' do
    expect(page).to have_css('input[type=submit]')
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
