class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.belongs_to :user, null: false

      t.timestamps null: false
    end
  end
end
