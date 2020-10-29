class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content
  has_one :user
  has_one :animal_shelter
end
