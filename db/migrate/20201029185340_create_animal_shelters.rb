class CreateAnimalShelters < ActiveRecord::Migration[6.0]
  def change
    create_table :animal_shelters do |t|
      t.string :first_name
      t.string :last_name
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :password_digest

      t.timestamps
    end
  end
end
