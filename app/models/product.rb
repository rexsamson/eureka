class Product < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    belongs_to :branch, inverse_of: :products
    NON_VALIDATABLE_ATTRS = ["id"]
    VALIDATABLE_ATTRS = Product.attribute_names.reject{|attr| NON_VALIDATABLE_ATTRS.include?(attr)}
    validates_presence_of VALIDATABLE_ATTRS
end
