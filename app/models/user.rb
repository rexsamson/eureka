class User < ApplicationRecord
    before_save { self.email = email.downcase}
    validates :name, presence: true, length: { maximum: 30}, uniqueness: { case_sensitive: false}
    validates :fullname, presence: true, length: { maximum: 50}, uniqueness: { case_sensitive: false}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 }, format: {with: VALID_EMAIL_REGEX}
    
    validates :password_digest, presence: true
    validates :branch_id, presence: true
    
    has_secure_password
    validates :password, presence: true, length: { minimum: 6}
    validates_confirmation_of :password

    belongs_to :branch
end
