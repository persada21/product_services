# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(email: "ersad40@gmail.com", name: "Ersad")
Product.create(name: "Test Product 1", price: 14000, category: "Electronics", user: User.first, image: Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/test_image.png"), "image/png"))
Product.create(name: "Test Product 2", price: 12000, category: "Electronics", user: User.first, image: Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/test_image.png"), "image/png"))
Product.create(name: "Test Product 3", price: 2000, category: "Electronics", user: User.first, image: Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/test_image.png"), "image/png"))
Product.create(name: "Test Product 4", price: 3000, category: "Electronics", user: User.first, image: Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/test_image.png"), "image/png"))
Product.create(name: "Test Product 5", price: 2000, category: "Electronics", user: User.first, image: Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/test_image.png"), "image/png"))
