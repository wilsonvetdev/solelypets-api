class AnimalSerializer < ActiveModel::Serializer
  attributes :id, :name, :species, :description
  has_one :AnimalShelter
end
