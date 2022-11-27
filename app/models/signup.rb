class Signup < ApplicationRecord
    #validations
    validates :time, inclusion: {in: 0..23}

    #macros
    belongs_to :camper
    belongs_to :activity
end
