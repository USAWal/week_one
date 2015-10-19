class CreateCategoryProductsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :products, :categories do |t|
      t.index [:category_id, :product_id], unique: true
    end
  end
end
