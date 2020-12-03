# require 'rspec'
require './lib/oystercard'

describe Oystercard do
  let(:card) { Oystercard.new }
  let(:station) {double("fake station")}
  let(:station2) {double("another fake station")}

  it 'is created with a default balance of zero' do
    expect(card.balance).to eq(0)
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
    it "creates a new instance of Journey" do
      card.top_up(Oystercard::MINIMUM_BALANCE + 1)
      expect(card.touch_in(station)).to be_a(Journey)
    end
    it 'returns an error when the balance is less than #{MINIMUM_BALANCE}' do
      expect { card.touch_in(station) }.to raise_error('The balance is less than (#{MINIMUM_BALANCE}). Top_up your card!')
    end
  end
  describe '#touch_out' do
    it "deducts the MINIMUM_FARE from the card balance" do
      card.top_up(20)
      card.touch_in(station)
      expect{card.touch_out(station)}.to change{card.balance}.from(20).to(20 - Oystercard::MINIMUM_FARE)
    end
    it 'stores the entry and exit stations in journey history' do
      card.top_up(Oystercard::MINIMUM_BALANCE + 1)
      card.touch_in(station)
      card.touch_out(station2)
      expect(card.journey_history[0]).to eq ({entry:station, exit:station2})
    end
  end
end
