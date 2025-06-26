class CreatePromotions < ActiveRecord::Migration[8.0]
  def change
    create_table :promotions do |t|
      t.string :product_code
      t.string :rule_type
      t.integer :min_quantity
      t.integer :price_in_cents
      t.decimal :multiplier
      t.boolean :active

      t.timestamps
    end
  end
end
