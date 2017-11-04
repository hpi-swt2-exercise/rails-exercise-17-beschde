require 'rspec'

describe 'Author index page', type: :feature do
  it 'should render without error' do
    visit authors_path
  end

  context 'once rendered' do
    before :each do
      visit authors_path
    end
  end
end