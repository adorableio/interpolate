require 'spec_helper'

describe 'Interpol Validation' do
  describe 'an invalid request' do
    before { post_json '/users', name: 'Ryland' }

    it 'is a bad request' do
      expect(response).to be_bad_request
    end
  end
end
