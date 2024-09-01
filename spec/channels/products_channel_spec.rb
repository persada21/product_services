# spec/channels/products_channel_spec.rb

require "rails_helper"

RSpec.describe ProductsChannel, type: :channel do
  before do
    # Simulate a subscription to the channel
    stub_connection user_id: 1
  end

  it "successfully subscribes" do
    subscribe
    expect(subscription).to be_confirmed
    expect(subscription).to have_stream_from("products_channel")
  end

  it "broadcasts a message to the products channel" do
    subscribe
    expect {
      ActionCable.server.broadcast("products_channel", {message: "Hello, World!"})
    }.to have_broadcasted_to("products_channel").with(message: "Hello, World!")
  end

  it "unsubscribes from the stream" do
    subscribe
    expect(subscription).to have_stream_from("products_channel")
    subscription.unsubscribe_from_channel
    expect(subscription).not_to have_stream_from("products_channel")
  end
end
