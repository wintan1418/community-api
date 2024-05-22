class User < ApplicationRecord
    has_secure_password
    has_many :posts
    has_many :comments
    has_many :reactions
    has_and_belongs_to_many :communities, join_table: "community_users"
    has_many :specialists
    has_many :retailers
    has_many :tutorials
  
    attribute :is_specialist, :boolean, default: false
    attribute :is_retailer, :boolean, default: false
    attribute :is_approved, :boolean, default: false
    attribute :admin, :boolean, default: false
    attribute :super_admin, :boolean, default: false
  

    
  
    validates :username, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }
    validates :alopecia_discovered_at, presence: true
    validates :alopecia_extent, presence: true, inclusion: { in: 1..10 }
    validates :location, presence: true
    validates :admin, inclusion: { in: [true, false] }
  end
  