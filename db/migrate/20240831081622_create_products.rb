class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.integer :price
      t.string :category
      t.string :image
      t.boolean :is_active, default: false

      t.timestamps
    end
  end
end
