require 'rails_helper'

describe AuthorsController, type: :controller do
  describe '#author_params' do
    include_examples 'parameter security', method: :author_params, form: :author, attributes: [:first_name, :last_name, :homepage]
  end
end
