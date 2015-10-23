class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.integer    :count,   null: false
      t.belongs_to :cart,    null: false
      t.belongs_to :product, null: false

      t.timestamps null: false
    end
  end
end
