class AssetDetail < ApplicationRecord
    validates :category, presence: true
    validates :value, presence: true
    belongs_to :assetm, inverse_of: :asset_details, optional: true

end
