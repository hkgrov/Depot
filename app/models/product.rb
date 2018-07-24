class Product < ApplicationRecord
    
    
    validates :description, :image_url, presence: true
    validates :price, numericality: {greater_than_or_equal_to: 0.01}
    validates :title, uniqueness: true
    validates :image_url, allow_blank: true, format: {with: %r{\.(gif|png|jpg)\Z}i, message: 'must be a URL for a GIF, PNG or JPG image'}
    
    validates :title, length: {minimum: 10, message: "must be at least 10 characters long"}
end
