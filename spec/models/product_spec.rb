require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should be able to be created' do
      category = Category.new
      product = Product.new(
        name: 'Anything',
        price: 100,
        quantity: 1,
        category: category
      )

      expect(product).to be_valid
    end

    it 'is not valid without a category' do
      category = Category.new
      product = Product.new(
        name: 'Overpriced Shirt',
        price: 100,
        quantity: 1,
        category: nil
      )

      expect(product).to_not be_valid
    end

    it 'is not valid without a name' do
      category = Category.new
      product = Product.new(
        name: nil,
        price: 100,
        quantity: 1,
        category: category
      )

      expect(product).to_not be_valid
    end

    it 'is not valid without a price' do
      category = Category.new
      product = Product.new(
        name: 'Overpriced Shirt',
        price: nil,
        quantity: 1,
        category: category
      )

      expect(product).to_not be_valid
    end

    it 'is not valid without a quantity' do
      category = Category.new
      product = Product.new(
        name: 'Overpriced Shirt',
        price: 100,
        quantity: nil,
        category: category
      )

      expect(product).to_not be_valid
    end
  end
end
