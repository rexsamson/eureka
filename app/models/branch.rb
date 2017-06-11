class Branch < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    has_many :accounts, inverse_of: :branch
    has_many :salesmen, inverse_of: :branch
    has_many :suppliers, inverse_of: :branch
    has_many :customers, inverse_of: :branch
    has_many :users, inverse_of: :branch
    has_many :groups, inverse_of: :branch
    has_many :inventories, inverse_of: :branch
    has_many :product_settings, inverse_of: :branch
    has_many :products, inverse_of: :branch
    has_many :transaction_logs, inverse_of: :branch
    validates :code, uniqueness: true
    validates :name, uniqueness: true
    
end