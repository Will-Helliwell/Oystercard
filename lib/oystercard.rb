class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1
  MINIMUM_BALANCE = MINIMUM_FARE

  attr_reader :balance, :in_journey, :entry_station

  def initialize(balance = 0)
    @balance = balance
    @in_journey = false
  end

  def top_up(money)
    raise "Cannot exeed max balance (#{MAXIMUM_BALANCE})!" if (@balance + money) > MAXIMUM_BALANCE

    @balance += money
  end

  def touch_in(station_name)
    raise 'The balance is less than (#{MINIMUM_BALANCE}). Top_up your card!' if balance < MINIMUM_BALANCE
    @in_journey = true
    @entry_station = station_name
  end

  def touch_out
    self.deduct(MINIMUM_FARE)
    @in_journey = false
    @entry_station = nil
  end

  private
  def deduct(money)
    @balance -= money
  end

end
