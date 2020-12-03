require 'oystercard'
class Journey

  attr_reader :entry_station, :ongoing

  def initialize(name)
    @entry_station = name
    @ongoing = false
  end

  def complete
  end


end
