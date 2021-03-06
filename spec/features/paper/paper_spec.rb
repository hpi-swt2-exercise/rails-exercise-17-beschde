require 'rails_helper'

describe 'Paper page', type: :feature do

  before :all do
    @paper = create(:paper)
  end

  it 'should render without error' do
    visit paper_path(@paper)
  end

  context 'once rendered' do
    before :each do
      visit paper_path(@paper)
    end

    it 'should display paper name in header' do
      expect(page).to have_xpath("//h1[contains(., '#{@paper.title}')]")
    end

    it 'should display paper details' do
      expect(page).to have_text("Title: #{@paper.title}")
      expect(page).to have_text("Venue: #{@paper.venue}")
      expect(page).to have_text("Year: #{@paper.year}")
    end

    it 'should have a link to the paper edit page' do
      expect(page).to have_link('Edit', href: edit_paper_path(@paper))
    end

    it 'should have a link to delete that paper' do
      expect(page).to have_css("a[href='#{paper_path(@paper)}'][data-method='delete']", text: 'Destroy')
    end

    it 'should delete the paper when destroy is clicked' do
      click_link 'Destroy'
      paper = Paper.find_by(id: @paper.id)
      expect(paper).to be_nil
    end

    it 'should link back to the paper index page' do
      expect(page).to have_link('Back', href: papers_path)
    end

    it 'should list the papers authors' do
      expect(page).to have_text(/Authors:.*#{@paper.authors.first.name}/)
      expect(page).to have_xpath("//ul/li[contains(., '#{@paper.authors.first.name}')]")
    end
  end

  after :all do
    Paper.destroy_all
    Author.destroy_all
  end
end
