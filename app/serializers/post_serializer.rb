# app/serializers/post_serializer.rb
class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :created_at, :updated_at, :reaction_count, :comment_count
  belongs_to :user
  belongs_to :community

  def reaction_count
    object.reactions.count
  end

  def comment_count
    object.comments.count
  end
end
