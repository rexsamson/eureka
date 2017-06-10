class Category < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    has_many :products, inverse_of: :category, :dependent => :restrict_with_error
    belongs_to :branch, inverse_of: :categories
    NON_VALIDATABLE_ATTRS = ["id"]
    VALIDATABLE_ATTRS = Category.attribute_names.reject{|attr| NON_VALIDATABLE_ATTRS.include?(attr)}
    validates_presence_of VALIDATABLE_ATTRS
end
