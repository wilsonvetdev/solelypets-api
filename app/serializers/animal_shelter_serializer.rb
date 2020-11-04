class AnimalShelterSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :name, :email, :address, :city, :state
end
