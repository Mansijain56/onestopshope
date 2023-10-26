class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :full_name
      t.bigint :mobile_number
      t.integer :pincode
      t.integer :house_no
      t.string :area
      t.string :landmark
      t.string :city
      t.string :state
      t.string :address_type
      t.string :order_status

      t.timestamps
    end
  end
end
