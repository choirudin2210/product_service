require 'rails_helper'

RSpec.describe Product, type: :model do

  before(:all) do
    @product = create(:product)
  end

  it "is valid with valid attributes" do
    expect(@product).to be_valid
  end

  it "product activate" do
    @product.active!
    expect(@product.is_active).to be_truthy
  end

end
