class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :user_id, :post_id, :created_at, :updated_at
end