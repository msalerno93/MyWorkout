class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: true

    has_many :workouts

    has_many :comments
    has_many :commented_workouts, through: :comments, source: :workout
end
