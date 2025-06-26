class Promotion < ApplicationRecord
  RULE_TYPES = %w[buy_one_get_one bulk_discount percent_off]

  # We will only accept valid rule_type
  validates :rule_type, inclusion: { in: RULE_TYPES }

  # To filter out active pricing rules.
  scope :active, -> { where(active: true) }
end
