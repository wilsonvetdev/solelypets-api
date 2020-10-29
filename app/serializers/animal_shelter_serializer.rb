class AnimalShelterSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :name, :address, :city, :state, :password_digest
end
