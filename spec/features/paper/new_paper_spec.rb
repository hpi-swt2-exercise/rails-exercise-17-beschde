require 'rails_helper'

describe 'New paper page' do
  it 'should render without error' do
    visit new_paper_path
  end
end
