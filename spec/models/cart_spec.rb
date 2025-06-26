require 'rails_helper'

RSpec.describe Cart, type: :model do
  # Associations
  it { should have_many(:cart_items) }
end
