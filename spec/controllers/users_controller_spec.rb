require 'spec_helper'

describe UsersController do
  let(:json_response) { JSON.parse(response.body) }
  let(:users_response) { json_response['users'] }
  let(:user_response) { json_response['user'] }

  describe '#index' do
    let!(:users) { create_list(:user, 3) }

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

    before { get :show, id: user.id }

    it 'returns an individual user' do
      expect(user_response).to include(
        'id' => user.id,
        'name' => user.name
      )
    end
  end

  describe '#create' do
    let(:user_params) do
      {
        name: 'user_name',
        birthday: Date.today
      }.stringify_keys
    end

    let(:action) { post :create, user_params }

    it 'creates the user' do
      expect { action }.to change { User.count }.from(0).to(1)
    end

    it 'returns the created user' do
      action

      expect(user_response.keys).to match_array(%w(id name birthday))
      expect(user_response).to include('name' => 'user_name')
    end
  end
end
