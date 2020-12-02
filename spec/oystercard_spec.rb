# require 'rspec'
require './lib/oystercard'

describe Oystercard do
  let(:card) { Oystercard.new }
  let(:station) {double("fake station")}
  let(:station2) {double("another fake station")}

  it 'is created with a default balance of zero' do
    expect(card.balance).to eq(0)
  end
  it 'is created without an entry station' do
    expect(card.entry_station).to eq(nil)
  end

  it 'is created with an empty journey history' do
    expect(card.journey_history).to eq([])
  end

  describe '#top_up' do
    it 'returns updated balance after calling top_up method' do
      card.top_up(20)
      expect(card.balance).to eq(20)
    end
    it 'returns an error if top-up will exceed MAXIMUM_BALANCE' do
      expect { card.top_up(Oystercard::MAXIMUM_BALANCE + 1) }.to raise_error("Cannot exeed max balance (#{Oystercard::MAXIMUM_BALANCE})!")
    end
  end
  describe '#touch_in' do
    it "changes the state of the card to 'in_journey' " do
      card.top_up(Oystercard::MINIMUM_BALANCE + 1)
      card.touch_in("station_name")
      expect(card.in_journey).to eq(true)
    end
    it 'returns an error when the balance is less than #{MINIMUM_BALANCE}' do
      expect { card.touch_in("station_name") }.to raise_error('The balance is less than (#{MINIMUM_BALANCE}). Top_up your card!')
    end
    it "updates the card location with the name of the station touched in at" do
      card.top_up(Oystercard::MINIMUM_BALANCE + 1)
      card.touch_in(station)
      expect(card.entry_station).to eq(station)
    end
  end
  describe '#touch_out' do
    it "changes the state of the card to 'not_in_journey'" do
      card.touch_out(station)
      expect(card.in_journey).to eq(false)
    end
    it "deducts the MINIMUM_FARE from the card balance" do
      card.top_up(20)
      card.touch_in("station_name")
      expect{card.touch_out(station)}.to change{card.balance}.from(20).to(20 - Oystercard::MINIMUM_FARE)
    end
    it "returns the entry_station of the card to nil" do
      card.top_up(Oystercard::MINIMUM_BALANCE + 1)
      card.touch_in(station)
      card.touch_out(station)
      expect(card.entry_station).to eq(nil)
    end
    it 'stores exit station on touch out' do
      card.top_up(Oystercard::MINIMUM_BALANCE + 1)
      card.touch_in(station)
      card.touch_out(station)
      expect(card.exit_station).to eq station
    end

    it 'stores the entry and exit stations in journey history' do
      card.top_up(Oystercard::MINIMUM_BALANCE + 1)
      card.touch_in(station)
      p station
      card.touch_out(station2)
      expect(card.journey_history[0]).to eq ({entry:station, exit:station2})
    end
  end
  describe '#in_journey?' do
    it "returns true for an 'in' card" do
      card.top_up(Oystercard::MINIMUM_BALANCE + 1)
      card.touch_in("station_name")
      expect(card.in_journey).to be(true)
    end
    it "returns false for an 'out' card" do
      card.touch_out(station)
      expect(card.in_journey).to be(false)
    end
  end
end
