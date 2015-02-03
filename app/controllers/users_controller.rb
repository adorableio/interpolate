class UsersController < ApplicationController
  def index
    @users = User.all

    render json: @users, root: :users
  end

  def show
    @user = User.find(params.require(:id))

    render json: @user, root: :user
  end
end
