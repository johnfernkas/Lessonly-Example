class Company < ApplicationRecord
    has_many :lessons
    
    validates :name, presence: true, length: { in: 3..254 }

    enum plan_level: [ :legacy, :custom, :basic, :plus, :growth, :enterprise ]

    before_create :set_default_plan, :set_trial_status

    scope :alphabetize, -> { order(name: :asc) }
    scope :modern, -> { where('plan_level != 0 AND plan_level != 1') }
    scope :not_trialing, -> { where('trial_status < ?', DateTime.now) }
    scope :created_last_month, -> { 
        where('created_at >= ? AND created_at < ?',
        Date.today.last_month.beginning_of_month, Date.today.beginning_of_month)
    }

    private
        def set_default_plan
            self.plan_level ||= 2
        end

        def set_trial_status
            self.trial_status = 30.days.from_now.beginning_of_day
        end
end
