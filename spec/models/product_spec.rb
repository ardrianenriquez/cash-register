require 'rails_helper'

RSpec.describe Product, type: :model do
  # Validations
  it { should validate_presence_of(:code) }
  it { should validate_uniqueness_of(:code) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:price_in_cents) }
end
