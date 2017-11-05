require 'rails_helper'

describe AuthorsController, type: :controller do
  describe '#author_params' do
    include_examples 'parameter security', :author_params, :author, [:first_name, :last_name, :homepage]
  end
end
