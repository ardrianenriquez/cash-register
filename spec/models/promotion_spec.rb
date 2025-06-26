require 'rails_helper'

RSpec.describe Promotion, type: :model do
  it "is valid with a supported rule type" do
    expect(build(:promotion, rule_type: "bulk_discount")).to be_valid
  end

  it "is invalid with unsupported rule type" do
    promotion = build(:promotion, rule_type: "invalid_type")
    expect(promotion).not_to be_valid
  end
end
