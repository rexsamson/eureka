class Account < ApplicationRecord
    validates :code, presence: true
    validates :label, presence: true
    validates :du, presence: true
    validates :dk, presence: true
    validates :header, presence: true
    validates :description, presence: true
    validates :id_branch, presence: true
end
