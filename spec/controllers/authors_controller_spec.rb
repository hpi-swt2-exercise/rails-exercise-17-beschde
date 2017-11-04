require 'rails_helper'

RSpec.describe AuthorsController, type: :controller do
  it 'should filter author parameters' do
    mock_params = double()
    filtered = double()
    expect(mock_params).to receive(:require).with(:author).and_return(filtered)
    expect(filtered).to receive(:permit) do |*args|
      expect(args).to contain_exactly(:first_name, :last_name, :homepage)
    end

    @controller = AuthorsController.new
    @controller.instance_exec do
      @_params = mock_params
      author_params
    end
  end
end
