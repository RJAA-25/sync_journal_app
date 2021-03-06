class User < ApplicationRecord
    has_secure_password
    has_many :categories
    has_many :tasks, through: :categories
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :username, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }
end
