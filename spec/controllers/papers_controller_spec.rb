require 'rails_helper'

describe PapersController, type: :controller do
  describe '#paper_params' do
    include_examples 'parameter security',
                     method: :paper_params,
                     form: :paper,
                     attributes: %i[title venue year author_ids]
  end
end
