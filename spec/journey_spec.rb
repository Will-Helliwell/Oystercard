require 'journey'

describe Journey do
  let(:station) {double("fake station")}
  subject { Journey.new(station) }

  it 'is created with an entry station' do
    expect(subject.entry_station).to eq(station)
  end

  it "is created with status 'in-journey'" do
    expect(subject.ongoing).to eq(true)
  end

  describe "#finish" do
    it "changes the status to 'out of journey'" do
      subject.finish
      expect(subject.ongoing).to eq(false)
    end
  end

  describe "#complete?" do
    it "returns false for a new journey" do
      expect(subject.complete?).to eq(false)
    end
    it "returns true for a completed journey" do
      subject.finish
      expect(subject.complete?).to eq(true)
    end
  end

end
