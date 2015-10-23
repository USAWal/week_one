class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.belongs_to :user, null: false
      t.string     :name, null: false
      t.string     :slug, null: false
      t.text       :description
      t.string     :logo

      t.timestamps null: false

      t.index :name, unique: true
      t.index :slug, unique: true
    end
  end
end
