class UsersController < ApplicationController
  def index
    @users = User.all

    render json: @users, root: :users
  end

  def show
    @user = User.find(params.require(:id))

    render json: @user, root: :user
  rescue ActiveRecord::RecordNotFound => e
    render json: {user: nil}, status: :not_found
  rescue StandardError => e
    render json: {errors: [e.message]}, status: :internal_server_error
  end

  def create
    @user = User.new(params.permit(:name, :birthday))

    if @user.save
      render json: @user, root: :user
    end
  end
end
