require 'spec_helper'

describe UsersController do
  let(:json_response) { JSON.parse(response.body) }

  describe '#index' do
    let!(:users) { create_list(:user, 3) }

    before { get :index }

    it 'returns all users' do
      expect(json_response.count).to eq(users.count)
    end

    it 'has the correct keys' do
      expect(json_response.first.keys).to match_array(%w(id name birthday))
    end
  end

  describe '#show' do
    let!(:user) { create(:user) }

    before { get :show, id: user.id }

    it 'returns an individual user' do
      expect(json_response).to include(
        'id' => user.id,
        'name' => user.name
      )
    end
  end
end
