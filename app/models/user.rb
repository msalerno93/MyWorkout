class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    # has_secure_password
    # validates :username, uniqueness: true
    # validates :username, presence: true
    validates :password, presence: true
    has_many :workouts

    has_many :comments
    has_many :commented_workouts, through: :comments, source: :workout
end
