class MembershipsController < ApplicationController
  before_action :set_community
  before_action :set_user, only: [:create, :destroy]

  # POST /communities/:community_id/memberships
  def create
    unless @community.users.include?(@user)
      @community.users << @user
      render json: { message: 'User successfully joined the community' }, status: :created
    else
      render json: { error: 'User is already a member of this community' }, status: :unprocessable_entity
    end
  end

  # DELETE /communities/:community_id/memberships
  def destroy
    if @community.users.include?(@user)
      @community.users.delete(@user)
      render json: { message: 'User successfully left the community' }, status: :ok
    else
      render json: { error: 'User is not a member of this community' }, status: :unprocessable_entity
    end
  end

  private

  def set_community
    @community = Community.find(params[:community_id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
