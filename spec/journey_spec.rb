require 'journey'

describe Journey do

  it 'is created with an entry station' do
    trip = Journey.new("entry station")
    expect(trip.entry_station).to eq("entry station")
  end

  it "is created with status 'in-journey'" do
    trip = Journey.new("entry station")
    expect(trip.ongoing).to eq(true)
  end

  describe "#finish" do
    it "changes the status to 'out of journey'" do
      trip = Journey.new("entry station")
      trip.finish
      expect(trip.ongoing).to eq(false)
    end
  end

  describe "#complete?" do
    it "returns false for a new journey" do
      trip = Journey.new("entry station")
      expect(trip.complete?).to eq(false)
    end
    it "returns true for a completed journey" do
      trip = Journey.new("entry station")
      trip.finish
      expect(trip.complete?).to eq(true)
    end
  end

end
