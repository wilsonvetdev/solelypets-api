class AnimalSerializer < ActiveModel::Serializer
  attributes :id, :capitalized_name, :capitalized_species, :description, :items
  has_one :animal_shelter
end
