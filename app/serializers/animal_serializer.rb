class AnimalSerializer < ActiveModel::Serializer
  attributes :id, :capitalized_name, :capitalized_species, :description, :items, :role
  has_one :animal_shelter
end
