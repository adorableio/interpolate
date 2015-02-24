require 'spec_helper'

describe 'Users API' do
  describe 'creating a user' do
    let(:valid_parameters) do
      {name: 'George Washington', birthday: '1732-02-22'}
    end

    before do
      post_json '/users', valid_parameters
    end

    it 'is valid' do
      expect(response).to be_success
    end
  end
end
