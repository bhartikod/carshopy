class ChangeIntegerToBigintProfile < ActiveRecord::Migration[6.1]
  def change
    change_column :profiles, :contact_no, :bigint
  end
end
