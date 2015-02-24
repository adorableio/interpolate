class UsersController < ApplicationController
  def index
    @users = User.all

    require 'pry'; binding.pry
    render json: @users, each_serializer: index_serializer, root: :users
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

  private

  def index_serializer
    require 'pry'; binding.pry
    case @request_version
    when '2.0'
      V2::UserSerializer
    else
      UserSerializer
    end
  end
end
