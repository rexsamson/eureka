class Warehouse < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    default_scope -> { order(name: :desc)}
    
    belongs_to :branch, inverse_of: :warehouses
    has_many :products, inverse_of: :warehouse, dependent: :destroy
    accepts_nested_attributes_for :products, allow_destroy: true, reject_if: proc { |att| att['code'].blank? }
    
    NON_VALIDATABLE_ATTRS = ["id", "created_at", "updated_at"] #or any other attribute that does not need validation
    VALIDATABLE_ATTRS = Warehouse.attribute_names.reject{|attr| NON_VALIDATABLE_ATTRS.include?(attr)}
    validates_presence_of VALIDATABLE_ATTRS
    
end
