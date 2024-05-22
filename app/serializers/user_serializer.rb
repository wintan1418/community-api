# app/serializers/user_serializer.rb
class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :alopecia_type, :alopecia_discovered_at, :alopecia_extent, :location, :admin, :created_at, :updated_at, :community_count, :post_count, :super_admin, :tutorial_count

  has_many :communities
  has_many :posts

  def community_count
    object.communities.count
  end

  def post_count
    object.posts.count
  end

  def tutorial_count
    object.tutorials.count
  end
end
