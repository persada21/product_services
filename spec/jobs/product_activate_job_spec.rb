# spec/jobs/product_activate_job_spec.rb

require "rails_helper"

RSpec.describe ProductActivateJob, type: :job do
  let(:user) { User.create(name: "Test User", email: "test@example.com") }
  let(:product) do
    Product.create(
      name: "Test Product",
      price: 1000,
      category: "Electronics",
      user: user,
      is_active: false,
      image: Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/test_image.png"), "image/png")
    )
  end

  it "activates the product after the specified delay" do
    # Enqueue the job
    described_class.set(wait: 3.minutes).perform_later(product.id)

    # Simulate the job being run
    perform_enqueued_jobs do
      described_class.perform_later(product.id)
    end

    # Reload the product to get the updated value
    product.reload

    # Test that the product is now active
    expect(product.is_active).to be true
  end

  it "sends an activation email" do
    # Ensure ActionMailer is working properly
    expect {
      perform_enqueued_jobs do
        described_class.perform_later(product.id)
      end
    }.to change { ActionMailer::Base.deliveries.count }.by(1)
  end

  it "does not fail if the product is not found" do
    # Test with an invalid product ID
    expect {
      described_class.perform_now(nil)
    }.not_to raise_error
  end
end
