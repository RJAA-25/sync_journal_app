class Task < ApplicationRecord
    belongs_to :categories
    validates :details, presence: true
    validates :schedule, presence: true
end
