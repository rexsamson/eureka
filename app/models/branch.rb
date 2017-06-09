class Branch < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    has_many :accounts
    has_many :salesmen
    validates :code, uniqueness: true
    validates :name, uniqueness: true
    
end