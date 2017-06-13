class Product < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    belongs_to :branch, inverse_of: :products, optional: true
    belongs_to :warehouse, inverse_of: :products, optional: true
end
