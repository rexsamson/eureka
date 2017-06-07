class Branch < ApplicationRecord
    NON_VALIDATABLE_ATTRS = ["id", "created_at", "updated_at"]
    VALIDATABLE_ATTRS = Customer.attribute_names.reject{|attr| NON_VALIDATABLE_ATTRS.include?(attr)}
    validates_presence_of VALIDATABLE_ATTRS
    has_many :accounts
    has_many :salesmen
    
end