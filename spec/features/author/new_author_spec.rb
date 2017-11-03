require 'rails_helper'

describe 'New author page', type: :feature do

  it 'should render withour error' do
    visit new_author_path
  end

  it "should display 'New Author'" do
    visit new_author_path

    expect(page).to have_text 'New Author'
  end

  it 'should have a form that can create an author' do
    visit new_author_path

    expect(page).to have_css("form[action='#{authors_path}'][method=post]")
  end

  it 'should have text input for first name, last name, and homepage' do
    visit new_author_path

    expect(page).to have_field('First name')
    expect(page).to have_field('Last name')
    expect(page).to have_field('Homepage')
  end

  it 'should have a submit button' do
    visit new_author_path

    expect(page).to have_css "input[type=submit][value='Save Author']"
  end
end