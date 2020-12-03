require './lib/oystercard'

class Journey
  attr_reader :entry_station
  attr_accessor :exit_station

  def initialize
    @entry_station = nil
    @exit_station = nil
  end

  def start(entry_station)
    @entry_station = entry_station
  end

  def finish
    @ongoing = false
    @entry_station = nil
    @exit_station = nil
  end

  def fare
    if @entry_station == nil && @exit_station != nil
      return Oystercard::PENALTY_FARE
    elsif @entry_station != nil && @exit_station == nil
      return Oystercard::PENALTY_FARE
    elsif @entry_station != nil && @exit_station != nil
      return Oystercard::MINIMUM_FARE
    else
      return 0
    end

  end

end
