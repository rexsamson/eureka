class Address < ApplicationRecord
    validates :name, presence: true
    belongs_to :customer, inverse_of: :addresses, optional: true
    belongs_to :supplier, inverse_of: :addresses, optional: true
end
