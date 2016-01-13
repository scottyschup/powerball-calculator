require_relative './powerball.rb'

if __FILE__ == $PROGRAM_NAME
  title = "Powerball Calculator"
  puts "#{title}\n#{'=' * title.length}"
  puts "How much is the next jackpot (in millions)?"
  puts "Ex: for $1.5B put '1500'.\n"
  jackpot = gets.chomp.to_i * 1_000_000
  calc = Powerball.new(jackpot)
  winnings = format('%.2f', calc.num_combos * calc.average_ticket_value)
  average = format('%.2f', calc.average_ticket_value)
  puts "Total winnings: $#{calc.format_num(winnings)}"
  puts "Ticket combinations: #{calc.format_num(calc.num_combos.to_s)}"
  puts "Average ticket value: $#{calc.format_num(average)}\n\n"
end
