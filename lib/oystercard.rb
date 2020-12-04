require './lib/station.rb'
require './lib/journey.rb'

class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  attr_reader :balance, :journey_history
  attr_accessor :current_journey

  def initialize(balance = 0)
    @balance = balance
    @journey_history = []
    @current_journey = Journey.new
  end

  def top_up(money)
    raise "Cannot exeed max balance (#{MAXIMUM_BALANCE})!" if (@balance + money) > MAXIMUM_BALANCE
    @balance += money
  end

  def touch_in(station_name)
    raise 'The balance is less than (#{MINIMUM_BALANCE}). Top_up your card!' if balance < MINIMUM_BALANCE
    # deducts penalty fare if user did not touch out on last journey, deducts zero otherwise
    self.deduct(@current_journey.fare)
    # sets entry station
    @current_journey.start(station_name)
  end

  def touch_out(station)
    # sets exit station
    @current_journey.exit_station = station
    # deducts correct fair if user touched in correctly, deducts penalty fare otherwise
    self.deduct(@current_journey.fare)
    @journey_history << {entry: @current_journey.entry_station, exit: @current_journey.exit_station}
    # resets entry and exit station to nil so that user will not be charged on next touch-in
    @current_journey.finish
  end

  private
  def deduct(money)
    @balance -= money
  end

end
