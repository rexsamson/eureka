class Journal < ApplicationRecord
    
    def self.search(search)
      where("code LIKE ?", "%#{search}%")
    end

    extend FriendlyId
    friendly_id :code, use: :slugged
    
    has_many :ledgers, inverse_of: :journal, dependent: :destroy
    belongs_to :branch, inverse_of: :journals
    accepts_nested_attributes_for :ledgers, allow_destroy: true, reject_if: proc { |att| att['coa'].blank? }
    
    NON_VALIDATABLE_ATTRS = ["id", "created_at", "updated_at"]
    VALIDATABLE_ATTRS = Journal.attribute_names.reject{|attr| NON_VALIDATABLE_ATTRS.include?(attr)}
    validates_presence_of VALIDATABLE_ATTRS

end
