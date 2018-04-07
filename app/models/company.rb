class Company < ApplicationRecord
    has_many :lessons
    
    validates :name, presence: true, length: { in: 3..254 }

    enum plan_level: [ :legacy, :custom, :basic, :plus, :growth, :enterprise ]

    before_create :set_default_plan, :set_trial_status

    scope :alphabetize, -> { order(name: :asc) }

    private
        def set_default_plan
            self.plan_level ||= 2
        end

        def set_trial_status
            self.trial_status = 30.days.from_now.beginning_of_day
        end
end
