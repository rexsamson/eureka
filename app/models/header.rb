class Header < ApplicationRecord
    validates :title, presence: true
    validates :header, presence: true
    validates :content, presence: true
    validates :footer, presence: true
    validates :note, presence: true
end
