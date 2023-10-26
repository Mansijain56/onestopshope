class CreateVouchers < ActiveRecord::Migration[6.1]
  def change
    create_table :vouchers do |t|
      t.references :user, null: false, foreign_key: true
      t.bigint :amount, default: 100000

      t.timestamps
    end
  end
end
