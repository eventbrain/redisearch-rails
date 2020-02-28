require 'spec_helper'

RSpec.describe RediSearch do
  it "has a version number" do
    expect(RediSearch::VERSION).not_to be nil
  end

  it "has a client connection to Redis" do
    expect(RediSearch.client).not_to be nil
  end
end
