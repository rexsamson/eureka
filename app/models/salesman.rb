class Salesman < ApplicationRecord
    validates :code, presence: true
    validates :name, presence: true
    validates :dbirth, presence: true
    validates :identity, presence: true
    validates :status, presence: true
    belongs_to :branch
    default_scope -> { order(updated_at: :desc)}
end
