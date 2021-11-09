class Workout < ApplicationRecord
    # belongs_to :musclegroup
    # MUSCLE = ["Chest", "Back", "Biceps", "Triceps", "Legs", "Shoulders"]
    
    validates :title, presence: true
    # validate :muscle_is_valid?


    # private
    #     def muscle_is_valid?
    #         if self.musclegroup && !MUSCLE.include?(self.musclegroup)
    #             self.errors.add(:musclegroup, "Must use Muscles Already Provided")
    #         end
    #     end
end
