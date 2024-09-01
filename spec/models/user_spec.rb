# spec/models/user_spec.rb

require "rails_helper"

RSpec.describe User, type: :model do
  # Example of a basic validation test
  it "is valid with valid attributes" do
    user = User.new(name: "John Doe", email: "john@example.com")
    expect(user).to be_valid
  end

  it "is not valid without a name" do
    user = User.new(name: nil, email: "john@example.com")
    expect(user).not_to be_valid
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "is not valid without an email" do
    user = User.new(name: "John Doe", email: nil)
    expect(user).not_to be_valid
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is not valid with a duplicate email" do
    User.create(name: "John Doe", email: "john@example.com")
    user = User.new(name: "Jane Doe", email: "john@example.com")
    expect(user).not_to be_valid
    expect(user.errors[:email]).to include("has already been taken")
  end

  # Example of a basic association test
  it "has many products" do
    assoc = described_class.reflect_on_association(:products)
    expect(assoc.macro).to eq :has_many
  end
end
