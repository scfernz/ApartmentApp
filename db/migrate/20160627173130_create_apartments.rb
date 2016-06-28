class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.float :latitude
      t.float :longitude
      t.string :address
      t.string :name
      t.string :contact
      t.float :bed
      t.float :bath
      t.integer :price
      t.string :description

      t.timestamps null: false
    end
  end
end
