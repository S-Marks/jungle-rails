class User < ActiveRecord::Base

    has_secure_password
    has_many :reviews

    validates :name, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :password, length: {minimum: 6}
    validates :password_digest, presence: true
end
