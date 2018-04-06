class Lesson < ApplicationRecord
    belongs_to :company
    
    validates :name, presence: true, format: { with: /\A[a-z0-9\s]+\Z/i }
end
