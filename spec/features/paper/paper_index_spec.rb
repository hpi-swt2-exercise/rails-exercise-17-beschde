require 'rails_helper'

describe 'Paper index page', type: :feature do
  it 'should render without error' do
    visit papers_path
  end

  context 'once rendered' do
    before :each do
      visit papers_path
    end

    it "should display 'Papers' in header" do
      expect(page).to have_xpath("//h1[contains(., 'Papers')]")
    end

    it 'should have a link to the add paper page' do
      expect(page).to have_link('Add paper', href: new_paper_path)
    end

    it 'should contain a table header' do
      expect(page).to have_xpath("//table/tr/th[contains(., 'Title')]")
      expect(page).to have_xpath("//table/tr/th[contains(., 'Venue')]")
      expect(page).to have_xpath("//table/tr/th[contains(., 'Year')]")
      expect(page).to have_xpath("//table/tr/th[contains(., 'Actions')]")
    end

    context 'given a paper' do
      before :all do
        @paper = create(:paper)
      end

      it 'should list papers in a table' do
        expect(page).to have_xpath("//table/tr/td[contains(., '#{@paper.title}')]")
        expect(page).to have_xpath("//table/tr/td[contains(., '#{@paper.venue}')]")
        expect(page).to have_xpath("//table/tr/td[contains(., '#{@paper.year}')]")
      end

      it 'should have a link to that papers edit page' do
        expect(page).to have_link('Edit', href: edit_paper_path(@paper))
      end

      it 'should have a link to that papers page' do
        expect(page).to have_link('Show', href: paper_path(@paper))
      end

      it 'should have a link to delete that paper' do
        expect(page).to have_css("a[href='#{paper_path(@paper)}'][data-method='delete']", text: 'Destroy')
      end

      after :all do
        Paper.destroy_all
        Author.destroy_all
      end
    end
  end
end
