require 'rails_helper'

describe PapersController, type: :controller do
  describe '#paper_params' do
    include_examples 'parameter security', :paper_params, :paper, [:title, :venue, :year]
  end
end
