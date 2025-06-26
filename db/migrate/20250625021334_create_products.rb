class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :code
      t.string :name
      t.integer :price_in_cents, default: 0

      t.timestamps
    end
  end
end
