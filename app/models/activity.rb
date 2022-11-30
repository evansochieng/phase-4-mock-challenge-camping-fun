class Activity < ApplicationRecord
    #macros
    has_many :signups, dependent: :destroy
    has_many :campers, through: :signups
end
