class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: true
    validates :username, presence: true
    has_many :workouts, :dependent => :delete_all
    

    has_many :comments, :dependent => :delete_all
    has_many :commented_workouts, through: :comments, source: :workout
end