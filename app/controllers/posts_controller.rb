class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]
  before_action :set_community, only: [:create]

  def show
    render json: @post, serializer: PostSerializer
  end

  def create
    @post = @community.posts.build(post_params)
    @post.user = User.find(params[:user_id])
    if @post.save
      render json: @post, status: :created, serializer: PostSerializer
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      render json: @post, serializer: PostSerializer
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    head :no_content
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def set_community
    @community = Community.find(params[:community_id,])
  end

  def post_params
    params.require(:post).permit(:title, :body, :community_id, :user_id)
  end
end
