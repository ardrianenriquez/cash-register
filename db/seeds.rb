# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Product.create!(code: "GR1", name: "Green Tea", price_in_cents: 311)
Product.create!(code: "SR1", name: "Strawberries", price_in_cents: 500)
Product.create!(code: "CF1", name: "Coffee", price_in_cents: 1123)

Promotion.create!(product_code: "GR1", rule_type: "buy_one_get_one", active: true)
Promotion.create!(product_code: "SR1", rule_type: "bulk_discount", min_quantity: 3, price_in_cents: 450, active: true)
Promotion.create!(product_code: "CF1", rule_type: "percent_off", min_quantity: 3, multiplier: 0.6666, active: true)
