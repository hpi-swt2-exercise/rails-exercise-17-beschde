require 'rails_helper'

RSpec.describe AuthorsController, type: :controller do
  describe '#author_params' do
    it 'should filter author parameters' do
      filtered = double()
      expect(filtered).to receive(:permit) do |*args|
        expect(args).to contain_exactly(:first_name, :last_name, :homepage)
      end
      @controller.params = { author: filtered }
      @controller.send(:author_params)
    end

    it 'should raise an error on missing parameter' do
      @controller.params = {}
      expect { @controller.send(:author_params) }.to raise_error(ActionController::ParameterMissing)
    end
  end
end
