class Target < ApplicationRecord
    validates :targetbox, presence: true
    validates :finishdate, presence: true
    belongs_to :salesman, optional: true
    
    
end