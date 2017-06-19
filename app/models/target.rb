class Target < ApplicationRecord
    validates :targetbox, presence: true
    validates :finishdate, presence: true
    belongs_to :salesman, inverse_of: :targets, optional: true

end