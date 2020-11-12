class AnimalShelterSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :name, :email, :full_address, :donations_received, :items, :city, :state, :address
  has_many :animals
end
