class ReactionSerializer < ActiveModel::Serializer
  attributes :id, :reaction_type, :user_id, :post_id, :created_at, :updated_at
end