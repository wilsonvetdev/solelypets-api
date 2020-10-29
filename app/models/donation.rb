class Donation < ApplicationRecord
  belongs_to :animal_shelter
  belongs_to :user
end
