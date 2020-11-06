class AddAnimalToItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :items, :animal, null: false, foreign_key: true
  end
end
