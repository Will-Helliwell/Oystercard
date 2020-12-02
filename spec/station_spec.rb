require 'rspec'
require './lib/station.rb'

describe Station do
  subject { described_class.new("Holborn", 1) }

  it "has a user-specified zone on creation" do
    expect(subject.zone).to eq(1)
  end
  it "has a user-specified name on creation" do
    expect(subject.name).to eq("Holborn")
  end

end
