require './lib/oystercard.rb'

puts card = Oystercard.new
card.balance
# card.touch_in("Bank")
puts card.top_up(20)
puts card.touch_in("Bank")
print card.touch_out("Holborn")
puts card.balance
puts card.touch_in("Chancery Lane")
print card.touch_out("Waterloo")
puts ""
print card.journey_history
puts card.balance
