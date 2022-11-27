class Camper < ApplicationRecord
    #validations
    validates :name, presence: true
    validates :age, inclusion: {in: 8..18}

    #macros
    has_many :signups
    has_many :activities, through: :signups
end
