require 'journey'

describe Journey do
  let(:station) {double("fake station")}
  let(:station2) {double("fake station 2")}
  subject { Journey.new }

  describe "#start" do
    it "sets the entry station" do
      subject.start(station)
      expect(subject.entry_station).to eq(station)
    end
  end

  describe "#finish" do
    it "resets the entry_station to nil" do
      subject.start(station)
      subject.finish
      expect(subject.entry_station).to eq(nil)
    end
    it "resets the exit_station to nil" do
      subject.start(station)
      subject.exit_station = station2
      subject.finish
      expect(subject.exit_station).to eq(nil)
    end
  end

  context "given exit station but no entry station (user skipped touching in at start of journey)" do
    describe "#fare" do
      it "it returns the penalty fare" do
        subject.exit_station = station
        expect(subject.fare).to eq(Journey::PENALTY_FARE)
      end
    end
  end
  context "given entry station but no exit station (user skipped touching out on previous journey)" do
    describe "#fare" do
      it "it returns the penalty fare" do
        subject.start(station)
        expect(subject.fare).to eq(Journey::PENALTY_FARE)
      end
    end
  end
  context "given entry station and exit station (user touched in and out correctly and so is charged at end of journey)" do
    describe "#fare" do
      it "it returns the minimum fare" do
        subject.start(station)
        subject.exit_station = station2
        expect(subject.fare).to eq(Journey::MINIMUM_FARE)
      end
    end
  end
  context "given neither entry station nor exit station (user touched in and out on previous journey and so no charge at the start of this journey)" do
    describe "#fare" do
      it "it returns nothing" do
        expect(subject.fare).to eq(0)
      end
    end
  end
end
