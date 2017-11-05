require 'rails_helper'

describe 'New paper page' do
  it 'should render without error' do
    visit new_paper_path
  end

  context 'once rendered' do
    before :each do
      visit new_paper_path
    end

    it 'should have a text input for title, venue and year' do

    end
  end
end
