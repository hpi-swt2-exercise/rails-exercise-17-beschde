require 'rspec'

describe 'Author page', type: :feature do

  before :all do
    @alan = FactoryGirl.create :author
  end

  it 'should render without error' do
    visit author_path(@alan)
  end

=begin
  context 'once rendered' do
    before :each do
      visit author_path(@alan)
    end

    it 'should do things' do

    end
  end
=end
end