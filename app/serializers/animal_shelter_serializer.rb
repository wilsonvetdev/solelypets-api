class AnimalShelterSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :name, :email, :address, :city, :state, :password_digest
end
