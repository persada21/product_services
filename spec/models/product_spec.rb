# spec/models/product_spec.rb

require "rails_helper"

RSpec.describe Product, type: :model do
  # Define a valid user that will be associated with the product
  let(:user) { User.create(name: "Test User", email: "test@example.com") }

  # Define a valid product for most of the tests
  let(:valid_product) do
    Product.new(
      name: "Test Product",
      price: 1000,
      category: "Electronics",
      user: user,
      image: Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/test_image.png"), "image/png")
    )
  end

  context "validations" do
    it "is valid with valid attributes" do
      expect(valid_product).to be_valid
    end

    it "is not valid without a name" do
      valid_product.name = nil
      expect(valid_product).not_to be_valid
      expect(valid_product.errors[:name]).to include("can't be blank")
    end

    it "is not valid without a price" do
      valid_product.price = nil
      expect(valid_product).not_to be_valid
      expect(valid_product.errors[:price]).to include("can't be blank")
    end

    it "is not valid without a category" do
      valid_product.category = nil
      expect(valid_product).not_to be_valid
      expect(valid_product.errors[:category]).to include("can't be blank")
    end
  end

  context "associations" do
    it "belongs to a user" do
      assoc = described_class.reflect_on_association(:user)
      expect(assoc.macro).to eq :belongs_to
    end
  end

  context "image uploader" do
    it "allows an image to be uploaded" do
      valid_product.save
      expect(valid_product.image).to be_present
    end
  end
end
