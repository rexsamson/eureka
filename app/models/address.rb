class Address < ApplicationRecord
     belongs_to :customer, inverse_of: :addresses
end
