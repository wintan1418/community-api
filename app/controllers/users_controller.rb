class UsersController < ApplicationController
  before_action :authorize_super_admin, only: [:approve_user, :make_admin]
  before_action :set_user, only: [:show, :update, :destroy]

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
    render json: @user, include: [:communities], except: [:password_digest, :created_at, :updated_at]
  end

  def approve_user
    user = User.find(params[:id])
    user.update(is_approved: true)
    render json: { message: 'User approved.' }
  end

  def make_admin
    user = User.find(params[:id])
    user.update(admin: true)
    render json: { message: 'User granted admin rights.' }
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :alopecia_type, :alopecia_discovered_at, :alopecia_extent, :location, :admin)
  end

  def current_user
    User.find(params[:user_id])
  end

  def authorize_super_admin
    unless current_user.super_admin?
      render json: { error: 'Only super admins can perform this action' }, status: :forbidden
    end
  end

  def authorize
    @user = User.find(params[:id])
    # Placeholder for future authentication logic
  end
end
