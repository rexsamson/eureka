class Inventory < ApplicationRecord
    validates :code, presence: true
    belongs_to :stock, inverse_of: :inventories, optional: true
end
