class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.string :description
      t.references :car, null: false, foreign_key: true

      t.timestamps
    end
  end
end
