class Account < ApplicationRecord
    extend FriendlyId
    friendly_id :code, use: :slugged
    validates :code, presence: true, length: {minimim: 1, maximum: 10}
    validates :label, presence: true
    validates :du, presence: true
    validates :dk, presence: true
    validates :header, presence: true
    validates :description, presence: true
    validates :branch_id, presence: true
    belongs_to :branch, inverse_of: :accounts
    
    def code_with_label
        "#{code} | #{label}"
    end
end
