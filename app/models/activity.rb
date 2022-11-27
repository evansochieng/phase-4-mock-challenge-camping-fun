class Activity < ApplicationRecord
    #macros
    has_many :signups
    has_many :campers, through: :signups
end
