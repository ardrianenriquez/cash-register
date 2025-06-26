class Product < ApplicationRecord
  validates :code, presence: true, uniqueness: true
  validates :name, :price_in_cents, presence: :true
end
