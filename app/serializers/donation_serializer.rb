class DonationSerializer < ActiveModel::Serializer
  attributes :id, :amount, :card_type, :card_number, :security_code, :zipcode
  has_one :animal_shelter
  has_one :user
end
