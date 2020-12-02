require 'oystercard'
class Journey

  attr_reader :entry_station

  def initialize(name)
    @entry_station = name
  end

end