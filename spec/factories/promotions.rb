FactoryBot.define do
  factory :promotion do
    product_code { "CF1" }
    rule_type { "percent_off" }
    min_quantity { 3 }
    multiplier { 2.0 / 3.0 }
    active { true }
  end
end
