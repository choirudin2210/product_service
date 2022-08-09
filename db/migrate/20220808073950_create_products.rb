class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :user
      t.string :name
      t.integer :price
      t.string :category
      t.boolean :is_active, default: false

      t.timestamps
    end
  end
end
