require 'rails_helper'

describe 'Author edit page', type: :feature do

  before :all do
    @alan = create(:author)
  end

  it 'should render without error' do
    visit edit_author_path(@alan)
  end

  context 'once rendered' do
    before :each do
      visit author_path(@alan)
    end
  end

  after :all do
    Author.destroy_all
  end
end
