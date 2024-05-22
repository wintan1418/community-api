class Post < ApplicationRecord
  belongs_to :user
  belongs_to :community
  has_many :comments, dependent: :destroy
  has_many :reactions, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
end
