class CreateEnquiries < ActiveRecord::Migration[6.1]
  def change
    create_table :enquiries do |t|
      t.string :mobile
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
