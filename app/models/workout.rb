class Workout < ApplicationRecord
    # MUSCLE = ["Chest", "Back", "Biceps", "Triceps", "Legs", "Shoulders"]
    belongs_to :user
    has_many :comments
    has_many :commented_users, through: :comments, source: :user
    
    validates :title, presence: true


    scope :alpha, -> {order("workouts.title ASC")}
    # validate :muscle_is_valid?


    # private
    #     def muscle_is_valid?
    #         if self.musclegroup && !MUSCLE.include?(self.musclegroup)
    #             self.errors.add(:musclegroup, "Must use Muscles Already Provided")
    #         end
    #     end
end
