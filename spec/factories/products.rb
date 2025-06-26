FactoryBot.define do
  factory :product do
    name { "Coffee" }
    code { "CF1" }
    price_in_cents { 1123 }
  end
end
