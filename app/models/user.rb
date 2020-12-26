class User < ApplicationRecord
    has_many :reviews 
    has_many :dramas, :through => :reviews
    validates :username, uniqueness: true, presence: true 
    validates :email, presence: true 
    has_secure_password 
end