class ProductSetting < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    NON_VALIDATABLE_ATTRS = ["id"]
    VALIDATABLE_ATTRS = ProductSetting.attribute_names.reject{|attr| NON_VALIDATABLE_ATTRS.include?(attr)}
    validates_presence_of VALIDATABLE_ATTRS
end