class CreateWorkouts < ActiveRecord::Migration[6.1]
  def change
    create_table :workouts do |t|
      t.string :title
      t.string :muscle
      # t.string :reps
      # t.string :sets
      # t.string :personal_record

      t.timestamps
    end
  end
end
