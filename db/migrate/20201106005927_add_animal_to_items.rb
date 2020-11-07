class AddAnimalToItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :items, :animal, foreign_key: true
    add_reference :items, :animal_shelter, foreign_key: true
  end
end
