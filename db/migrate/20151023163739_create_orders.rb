class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :seller_id, null: false
      t.integer :client_id, null: false

      t.timestamps null: false
    end
  end
end
