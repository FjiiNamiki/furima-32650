class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string :zipcode, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :adress, null: false
      t.string :building
      t.string :phonenumber, null: false
      t.references :order, null: false, foreign_key: true
      t.timestamps
    end
  end
end
