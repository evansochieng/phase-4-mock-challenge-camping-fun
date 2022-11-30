class CampActivSerializer < ActiveModel::Serializer
  attributes :id, :name, :age

  #macro
  has_many :activities 
end
