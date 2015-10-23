class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title, null: false
      t.string :slug,  null: false

      t.timestamps null: false

      t.index :slug, unique: true
    end
  end
end
