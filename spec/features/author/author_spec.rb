require 'rspec'

describe 'Author page', type: :feature do

  before :all do
    @alan = create(:author)
  end

  it 'should render without error' do
    visit author_path(@alan)
  end

=begin
  context 'once rendered' do
    before :each do
      visit author_path(@alan)
    end

    it 'should display author details' do

    end
  end
=end

  after :all do
    Author.destroy_all
  end
end