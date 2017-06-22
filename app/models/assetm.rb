class Assetm < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    default_scope -> { order(date: :desc)}
    
    belongs_to :branch, inverse_of: :assetms
    has_many :asset_details, inverse_of: :assetm, dependent: :destroy
    accepts_nested_attributes_for :asset_details, allow_destroy: true, reject_if: proc { |att| att['category'].blank? }
    
    NON_VALIDATABLE_ATTRS = ["id", "created_at", "updated_at"] #or any other attribute that does not need validation
    VALIDATABLE_ATTRS = Assetm.attribute_names.reject{|attr| NON_VALIDATABLE_ATTRS.include?(attr)}
    validates_presence_of VALIDATABLE_ATTRS

end

