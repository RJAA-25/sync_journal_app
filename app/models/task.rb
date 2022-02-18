class Task < ApplicationRecord
    belongs_to :category
    validates :details, presence: true
    validates :schedule, presence: true
end
