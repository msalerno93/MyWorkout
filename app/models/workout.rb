class MuscleValidator < ActiveModel::Validator
    MUSCLE = ["Chest", "Back", "Biceps", "Triceps", "Legs", "Shoulders"]
    def validate(record)
        if !MUSCLE.include?(record.muscle)
            record.errors.add :base, "Must Choose one of the following Muscles - Chest, Back, Biceps, Triceps, Legs, Shoulders"
        end
    end
end

class Workout < ApplicationRecord
    MUSCLE = ["Chest", "Back", "Biceps", "Triceps", "Legs", "Shoulders"]
    belongs_to :user
    has_many :comments
    has_many :commented_users, through: :comments, source: :user
    
    validates :title, uniqueness: true
    validates :title, presence: true
    validates :muscle, presence: true
    validates_with MuscleValidator

    scope :alpha, -> {order("workouts.title ASC")}
    # validate :muscle_is_valid?


    # private
    #     def muscle_is_valid?
    #         if self.musclegroup && !MUSCLE.include?(self.musclegroup)
    #             self.errors.add(:musclegroup, "Must use Muscles Already Provided")
    #         end
    #     end
end
