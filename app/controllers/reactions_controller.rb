class ReactionsController < ApplicationController
  before_action :set_reaction, only: [:destroy]
  before_action :set_post, only: [:create]

  def create
    @reaction = @post.reactions.build(reaction_params)
    @reaction.user = User.find(params[:user_id])
    if @reaction.save
      render json: @reaction, status: :created, serializer: ReactionSerializer
    else
      render json: @reaction.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @reaction.destroy
    head :no_content
  end

  private

  def set_reaction
    @reaction = Reaction.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def reaction_params
    params.require(:reaction).permit(:reaction_type)
  end
end