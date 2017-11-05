require 'rails_helper'

describe Paper, type: :model do
  before :each do
    @paper = build(:paper)
  end

  it 'should have a title, venue and year' do
    paper
  end
end
