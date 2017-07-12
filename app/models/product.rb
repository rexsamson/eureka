class Product < ApplicationRecord
    
    def self.search(search)
      where("code LIKE ?", "%#{search}%")
    end
    
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
        
    def code_with_name
        "#{code} | #{name}"
    end
end

