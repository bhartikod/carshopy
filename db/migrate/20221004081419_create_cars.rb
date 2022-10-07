class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.string :price
      t.string :manufacturing_year
      t.string :varient
      t.references :user, null: false, foreign_key: true
      

      t.timestamps
    end
  end
end
