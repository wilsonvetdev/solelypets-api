class ItemSerializer < ActiveModel::Serializer
  attributes :id, :image, :animal_id, :animal_shelter_id
end
