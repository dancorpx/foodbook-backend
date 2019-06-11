class Recipe < ApplicationRecord
    belongs_to :user
    # has_one :user
    validates :title, presence: true 
    validates :method, presence: true
    validates :image_url, presence: true
    validates :ingredients, presence: true
end
