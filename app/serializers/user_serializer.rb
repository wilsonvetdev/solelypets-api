class UserSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :email, :customer_id
  has_many :donations
  has_many :comments
end
