class Supplier < ApplicationRecord
    
    def self.search(search)
      where("name LIKE ?", "%#{search}%")
    end
    
    extend FriendlyId
    friendly_id :name, use: :slugged
    
    has_many :addresses, inverse_of: :supplier, dependent: :destroy
    belongs_to :branch, inverse_of: :suppliers
    accepts_nested_attributes_for :addresses, allow_destroy: true, reject_if: proc { |att| att['name'].blank? }
    
    NON_VALIDATABLE_ATTRS = ["id", "created_at", "updated_at"]
    VALIDATABLE_ATTRS = Supplier.attribute_names.reject{|attr| NON_VALIDATABLE_ATTRS.include?(attr)}
    validates_presence_of VALIDATABLE_ATTRS

end