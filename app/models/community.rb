class Community < ApplicationRecord
#   has_and_belongs_to_many :users
  has_and_belongs_to_many :users, join_table: "community_users"

  has_many :posts

  validates :name, presence: true, uniqueness: true
end
