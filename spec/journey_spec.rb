require 'journey'

describe Journey do

  it 'a journey is created with an entry station' do
    trip = Journey.new("entry station")
    expect(trip.entry_station).to eq("entry station")
  end

  it "a journey is created with status 'in-journey'" do
    trip = Journey.new("entry station")
    expect(trip.ongoing).to eq(false)
  end

end
