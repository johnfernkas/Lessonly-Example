class Company < ApplicationRecord
    enum plan_level: [ :legacy, :custom, :basic, :plus, :growth, :enterprise ]

    before_create :set_default_plan

    private
        def set_default_plan
            self.plan_level ||= 2
        end
end
