class CreateProductShopsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :products, :shops do |t|
      t.index [:shop_id, :product_id], unique: true
    end
  end
end
