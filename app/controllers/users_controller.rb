class UsersController < ApplicationController
  def index
    @users = User.all

    render json: @users, root: :users
  end

  def show
    @user = User.find(params.require(:id))

    render json: @user, root: :user
  end

  def create
    @user = User.new(params.permit(:name, :birthday))

    if @user.save
      render json: @user, root: :user
    end
  end
end
