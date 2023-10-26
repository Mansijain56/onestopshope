class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :mobile, :bigint
  end
end
