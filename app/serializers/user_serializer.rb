class UserSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :email, :customer_id, :paid_donations_count, :total_donations_amount, :donated_to
  has_many :comments

end
