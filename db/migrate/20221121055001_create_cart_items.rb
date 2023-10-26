class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.references :cart, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.bigint :quantity, default: 1

      t.timestamps
    end
    add_index :cart_items, [:cart_id, :product_id], unique: true, name: :coustom_index_name
  end
end
