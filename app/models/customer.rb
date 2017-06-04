class Customer < ApplicationRecord
    has_many :addresses, inverse_of: :customer, dependent: :destroy
    belongs_to :branch
    accepts_nested_attributes_for :addresses, reject_if: :reject_posts, allow_destroy: true
    
    def reject_posts(attributes)
        attributes['name'].blank?
    end
end
