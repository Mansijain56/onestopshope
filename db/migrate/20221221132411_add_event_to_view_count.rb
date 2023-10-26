class AddEventToViewCount < ActiveRecord::Migration[6.1]
  def change
    add_column :view_counts, :event, :string, null: false
    add_index :view_counts, [:user_id, :product_id, :event], unique: true
  end
end
