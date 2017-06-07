class Address < ApplicationRecord
     belongs_to :customer, optional: true
end
