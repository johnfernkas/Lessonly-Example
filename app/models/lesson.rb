class Lesson < ApplicationRecord
    validates :name, presence: true, format: { with: /\A[a-z0-9\s]+\Z/i }
end
