class MucsleValidator < ActiveModel::Validator
    MUSCLE = ["chest", "back", "biceps", "triceps", "legs", "shoulders"]
    def validate(record)
        if !MUSCLE.include?(record.muscle.downcase)
            record.errors.add :base, "must have on of these muscles (Chest, Back, Biceps, Triceps, Legs, or Shoulders)"
        end
    end
end

class Workout < ApplicationRecord
    # MUSCLE = ["Chest", "Back", "Biceps", "Triceps", "Legs", "Shoulders"]
    belongs_to :user
    has_many :comments
    has_many :commented_users, through: :comments, source: :user
    
    validates :title, uniqueness: true
    validates :title, presence: true
    validates :muscle, presence: true


    scope :alpha, -> {order("workouts.title ASC")}
    # validate :muscle_is_valid?
    validates_with MucsleValidator

    # private
    #     def muscle_is_valid?
    #         if !MUSCLE.include?(self.musclegroup)
    #             self.errors.add(:musclegroup, "Must use Muscles Already Provided")
    #         end
    #     end
end
