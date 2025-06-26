require 'rails_helper'

RSpec.describe Checkout do
  let(:cart) { create(:cart) }
  let(:green_tea) { create(:product, code: "GR1", name: "Green Tea", price_in_cents: 311) }
  let(:coffee) { create(:product, code: "CF1", name: "Coffee", price_in_cents: 1123) }
  let(:strawberry) { create(:product, code: "SR1", name: "Strawberry", price_in_cents: 500) }

  before do
    create(:promotion, product_code: green_tea.code, rule_type: "buy_one_get_one")
    create(:promotion, product_code: coffee.code, rule_type: "percent_off", min_quantity: 3, multiplier: 2.0 / 3.0)
    create(:promotion, product_code: strawberry.code, rule_type: "bulk_discount", min_quantity: 3, price_in_cents: 450)
  end

  it "calculates correct total for GR1, CF1 x3, SR1" do
    create(:cart_item, cart: cart, product: green_tea, quantity: 1)
    create(:cart_item, cart: cart, product: coffee, quantity: 3)
    create(:cart_item, cart: cart, product: strawberry, quantity: 1)

    total = Checkout.new(cart).total
    expect(total).to eq(30.57)
  end
end
