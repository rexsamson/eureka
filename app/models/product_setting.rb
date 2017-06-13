class ProductSetting < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    validates :code, presence: true, length: {minimim: 1, maximum: 10}
    validates :product_type, presence: true
    validates :branch_id, presence: true
    belongs_to :branch, inverse_of: :product_settings
end