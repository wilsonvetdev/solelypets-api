class CreateDonations < ActiveRecord::Migration[6.0]
  def change
    create_table :donations do |t|
      t.float :amount
      t.string :card_type
      t.string :card_number
      t.string :security_code
      t.string :zipcode
      t.belongs_to :animal_shelter, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
