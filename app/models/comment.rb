class Comment < ApplicationRecord
    validates :text, presence: true
    # validates :text, uniqueness: true
    belongs_to :user
    belongs_to :workout
end
