require 'spec_helper'

describe UsersController do
  let(:json_response) { JSON.parse(response.body) }

  describe '#index' do
    let!(:users) { create_list(:user, 3) }
    let(:users_response) { json_response['users'] }

    before { get :index }

    it 'returns all users' do
      expect(users_response.count).to eq(users.count)
    end

    it 'has the correct keys' do
      expect(users_response.first.keys).to match_array(%w(id name birthday))
    end
  end

  describe '#show' do
    let!(:user) { create(:user) }
    let(:user_response) { json_response['user'] }

    before { get :show, id: user.id }

    it 'returns an individual user' do
      expect(user_response).to include(
        'id' => user.id,
        'name' => user.name
      )
    end
  end
end
