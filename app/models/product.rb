class Product < ApplicationRecord
    has_many :line_items
    
    before_destroy :ensure_not_referenced_by_any_line_item
    validates :description, :image_url, presence: true
    validates :price, numericality: {greater_than_or_equal_to: 0.01}
    validates :title, uniqueness: true
    validates :image_url, allow_blank: true, format: {with: %r{\.(gif|png|jpg)\Z}i, message: 'must be a URL for a GIF, PNG or JPG image'}
    validates :title, length: {minimum: 10, message: "must be at least 10 characters long"}
    
    private
        def ensure_not_referenced_by_any_line_item
            unless line_items.empty?
                error.add(:base, 'Line Items present')
                throw :abort
            end
        end
    
end
