# app/serializers/community_serializer.rb
class CommunitySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :created_at, :updated_at, :member_count, :post_count

  has_many :users
  has_many :posts

  def member_count
    object.users.count
  end

  def post_count
    object.posts.count
  end
end
