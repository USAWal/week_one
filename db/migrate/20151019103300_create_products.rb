class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string  :title,       null: false
      t.text    :description
      t.float   :price,       null: false, default: 0.0
      t.integer :stock_level, null: false, default: 0

      t.timestamps null: false
    end
  end
end
