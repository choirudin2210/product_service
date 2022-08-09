require 'rails_helper'

RSpec.describe Product, type: :model do

  before(:all) do
    @product = create(:product)
  end

  it "is valid with valid attributes" do
    expect(@product).to be_valid
  end
end
