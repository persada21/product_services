# spec/mailers/product_mailer_spec.rb

require "rails_helper"

RSpec.describe ProductMailer, type: :mailer do
  let(:user) { User.create(name: "Test User", email: "test@example.com") }
  let(:product) do
    Product.create(
      name: "Test Product",
      price: 1000,
      category: "Electronics",
      user: user,
      is_active: true,
      image: Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/test_image.png"), "image/png")
    )
  end

  describe "activation_email" do
    let(:mail) { ProductMailer.activation_email(product) }

    it "renders the headers" do
      expect(mail.subject).to eq("Your Product is Now Active!")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["ersad40@gmail.com"])
    end

    it "renders the body with the correct content" do
      expect(mail.body.encoded).to match("Selamat!")
      expect(mail.body.encoded).to match("Produk Anda \"Test Product\" berhasil di aktivasi.")
      expect(mail.body.encoded).to match("Nama Produk: Test Product")
      expect(mail.body.encoded).to match("Harga: 1000")
      expect(mail.body.encoded).to match("Kategori: Electronics")
      # Check that the src attribute contains the correct image URL
      expect(mail.body.encoded).to include("src=\"#{product.image.url}\"")
    end
  end
end
