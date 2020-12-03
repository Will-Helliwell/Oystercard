require './lib/oystercard'

class Journey
  attr_reader :entry_station, :ongoing

  def initialize(name)
    @entry_station = name
    @ongoing = true
  end

  def finish
    @ongoing = false
  end

  def complete?
    !@ongoing
  end

end
