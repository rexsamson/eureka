class Branch < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    has_many :accounts, inverse_of: :branch
    has_many :salesmen, inverse_of: :branch
    validates :code, uniqueness: true
    validates :name, uniqueness: true
    
end