class User < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    before_save { self.email = email.downcase}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum: 255},
        format: {with: VALID_EMAIL_REGEX },
        uniqueness: {case_sensitive: false }
    validates :branch_id, presence: true
    validates :name, presence: true
    validates :fullname, presence: true
    
    has_secure_password
    validates :password, presence: true, length: {minimum: 5}, allow_nil: true

    belongs_to :branch, inverse_of: :users, dependent: :destroy
end
