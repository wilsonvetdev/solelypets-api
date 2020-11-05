class Animal < ApplicationRecord
  belongs_to :animal_shelter

  def capitalized_name
    self.name.capitalize 
  end

  def capitalized_species 
    self.species.capitalize 
  end
  
end
