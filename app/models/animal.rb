class Animal < ApplicationRecord
  has_many :items, dependent: :destroy
  belongs_to :animal_shelter

  def capitalized_name
    self.name.capitalize 
  end

  def capitalized_species 
    self.species.capitalize 
  end
  
end
