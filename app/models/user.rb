class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: true
    validates :username, presence: true
    validates :password_digest, presence: true
    has_many :workouts

    has_many :comments
    has_many :commented_workouts, through: :comments, source: :workout
end
