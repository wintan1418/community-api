class CommentsController < ApplicationController
  before_action :set_comment, only: [:update, :destroy]
  before_action :set_post, only: [:create]

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = User.find(params[:user_id])
    if @comment.save
      render json: @comment, status: :created, serializer: CommentSerializer
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @comment.update(comment_params)
      render json: @comment, serializer: CommentSerializer
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    head :no_content
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
