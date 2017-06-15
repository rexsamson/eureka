class Product < ApplicationRecord
    extend FriendlyId
    friendly_id :code, use: :slugged
    belongs_to :branch, inverse_of: :products, optional: true
    belongs_to :warehouse, inverse_of: :products, optional: true
    
    attr_accessor :products_brand, 
        :products_size, 
        :products_motif, 
        :products_type, 
        :products_density, 
        :products_color,
        :products_custom,
        :products_quality
end

