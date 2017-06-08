class Address < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    belongs_to :customer, optional: true
    belongs_to :supplier, optional: true
end
