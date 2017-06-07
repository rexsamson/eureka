class Customer < ApplicationRecord
    has_many :addresses, inverse_of: :customer, dependent: :destroy
    belongs_to :branch
    accepts_nested_attributes_for :addresses, allow_destroy: true, reject_if: proc { |att| att['name'].blank? }
    
    NON_VALIDATABLE_ATTRS = ["id", "created_at", "updated_at"] #or any other attribute that does not need validation
    VALIDATABLE_ATTRS = Customer.attribute_names.reject{|attr| NON_VALIDATABLE_ATTRS.include?(attr)}
    validates_presence_of VALIDATABLE_ATTRS
end
