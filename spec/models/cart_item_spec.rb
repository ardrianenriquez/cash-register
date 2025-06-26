require 'rails_helper'

RSpec.describe CartItem, type: :model do
  # Associations
  it { should belong_to(:cart) }
  it { should belong_to(:product) }

  # Validations
  it { should validate_numericality_of(:quantity).is_greater_than(0) }
end
