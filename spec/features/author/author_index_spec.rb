require 'rails_helper'

describe 'Author index page', type: :feature do
  it 'should render without error' do
    visit authors_path
  end

  context 'once rendered' do
    before :each do
      visit authors_path
    end

    it "should display 'Authors' in header" do
      expect(page).to have_xpath("//h1[contains(., 'Authors')]")
    end

    it 'should have a link to the add author page' do
      expect(page).to have_link('Add author', href: new_author_path)
    end

    it 'should contain a table header' do
      expect(page).to have_xpath("//table/tr/th[contains(., 'Name')]")
      expect(page).to have_xpath("//table/tr/th[contains(., 'Homepage')]")
      expect(page).to have_xpath("//table/tr/th[contains(., 'Actions')]")
    end

    context 'given an author' do
      before :all do
        @alan = create(:author)
      end

      it 'should list authors in a table' do
        expect(page).to have_xpath("//table/tr/td[contains(., '#{@alan.name}')]")
        expect(page).to have_xpath("//table/tr/td[contains(., '#{@alan.homepage}')]")
      end

      it 'should link to that authors page' do
        expect(page).to have_link('Show', href: author_path(@alan))
      end

      it 'should link to that authors edit page' do
        expect(page).to have_link('Edit', href: edit_author_path(@alan))
      end

      after :all do
        Author.destroy_all
      end
    end
  end
end
