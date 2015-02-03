require 'spec_helper'

describe UsersController do
  describe '#index' do
    let(:json_response) { JSON.parse(response.body) }
    let!(:users) { create_list(:user, 3) }

    before { get :index }

    it 'returns all users' do
      expect(json_response.count).to eq(users.count)
    end

    it 'has the correct keys' do
      expect(json_response.first.keys).to match_array(%w(id name birthday))
    end
  end
end
