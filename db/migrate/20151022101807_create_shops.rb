class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.belongs_to :user, null: false
      t.string :name,     null: false

      t.timestamps null: false

      t.index :name, unique: true
    end
  end
end
