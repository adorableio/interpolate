require 'spec_helper'

describe User do
  let(:user) { User.new }

  it 'has a name' do
    expect(user).to respond_to(:name)
  end

  it 'has a birthday' do
    expect(user).to respond_to(:birthday)
  end
end
