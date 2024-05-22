class CommunitiesController < ApplicationController
  before_action :authorize_admin, only: [:create, :update, :destroy]
  before_action :set_community, only: [:show, :update, :destroy, :members, :posts]

  def index
    @communities = Community.all
    render json: @communities
  end

  def show
    render json: @community
  end

  def create
    @community = Community.new(community_params)
    if @community.save
      render json: @community, status: :created
    else
      render json: @community.errors, status: :unprocessable_entity
    end
  end

  def update
    if @community.update(community_params)
      render json: @community
    else
      render json: @community.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @community.destroy
    head :no_content
  end

  def members
    render json: @community.users
  end

  def posts
    render json: @community.posts.includes(:comments, :reactions).map { |post| 
      post.as_json.merge(
        comment_count: post.comments.count,
        reaction_count: post.reactions.count
      )
    }
  end

  private

  def set_community
    @community = Community.find(params[:id])
  end

  def community_params
    params.require(:community).permit(:name, :description)
  end

  def authorize_admin
    user = User.find(params[:user_id])
    unless user.admin?
      render json: { error: 'Only admin users can perform this action' }, status: :forbidden
    end
  end
end
