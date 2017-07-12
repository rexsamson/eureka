class Stock < ApplicationRecord
    
    def self.search(search)
      where("code LIKE ?", "%#{search}%")
    end

    extend FriendlyId
    friendly_id :code, use: :slugged
    
    has_many :inventories, inverse_of: :stock, dependent: :destroy
    belongs_to :branch, inverse_of: :stocks
    accepts_nested_attributes_for :inventories, allow_destroy: true, reject_if: proc { |att| att['code'].blank? }
    
    NON_VALIDATABLE_ATTRS = ["id", "created_at", "updated_at"]
    VALIDATABLE_ATTRS = Stock.attribute_names.reject{|attr| NON_VALIDATABLE_ATTRS.include?(attr)}
    validates_presence_of VALIDATABLE_ATTRS

end

