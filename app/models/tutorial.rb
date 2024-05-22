# app/models/tutorial.rb
class Tutorial < ApplicationRecord
    belongs_to :user
  
    validates :name, presence: true
    validates :description, presence: true
    validates :url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]) }
  end
  