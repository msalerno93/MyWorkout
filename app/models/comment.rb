class Comment < ApplicationRecord
    validates :text, uniqueness: true
    belongs_to :user
    belongs_to :workout
end
