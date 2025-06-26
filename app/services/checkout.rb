# frozen_string_literal: true

class Checkout
  BUY_ONE_GET_ONE_GROUP_SIZE = 2

  def initialize(cart)
    @cart = cart
    @items = cart.cart_items.includes(:product)
    @rules = Promotion.active.index_by(&:product_code)
  end

  def total
    total_amoun_in_cents = @items.sum do |item|
      compute_price(item.product, item.quantity, @rules[item.product.code])
    end.round(2)

    # Convert to decimal amount
    (total_amoun_in_cents.to_f / 100.0).round(2)
  end

  private

  def compute_price(product, quantity, rule)
    rule_types = Promotion::RULE_TYPES
    price_in_cents = product.price_in_cents

    return quantity * price_in_cents unless rule_types.include?(rule.rule_type)

    case rule.rule_type
    when "buy_one_get_one"
      total_pairs = quantity / BUY_ONE_GET_ONE_GROUP_SIZE
      leftover = quantity % BUY_ONE_GET_ONE_GROUP_SIZE

      total_quantity = total_pairs + leftover
      total_quantity * price_in_cents

    when "bulk_discount"
      price = quantity >= rule.min_quantity ? rule.price_in_cents : price_in_cents
      quantity * price

    when "percent_off"
      if quantity >= rule.min_quantity
        discounted = product.price_in_cents * rule.multiplier
        discounted * quantity
      else
        product.price_in_cents * quantity
      end

    else
      quantity * price_in_cents
    end
  end
end
