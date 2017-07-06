class Ledger < ApplicationRecord
    validates :coa, presence: true
    belongs_to :journal, inverse_of: :ledgers, optional: true
end
