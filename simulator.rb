require_relative './powerball.rb'

if __FILE__ == $PROGRAM_NAME
  title = "Powerball Calculator"
  puts "#{title}\n#{'=' * title.length}"
  puts "How much is the next jackpot (in millions)?"
  puts "Ex: for $1.5B put '1500'.\n"
  jackpot = gets.chomp.to_i * 1_000_000
  calc = Powerball.new(jackpot)

  puts "How many tickets would you like to buy?\n"
  num_tix = gets.chomp.to_i
  results = calc.simulator(num_tix)
  highest = format('%.2f', results[:max_win])
  total = format('%.2f', results[:winnings])

  puts "Out of #{results[:attempts]} attempts, you won #{results[:wins]} times."
  puts "Your highest winning ticket is $#{calc.format_num(highest)}."
  puts "Your total winnings are $#{calc.format_num(total)}."
  outcome = results[:outcome] > 0 ? '$' : '-$'
  outcome += calc.format_num(format('%.2f', results[:outcome].abs))
  puts "At $2 per ticket, your net profit is #{outcome}."
  if results[:outcome] > 0
    puts "Congrats! You beat the odds!"
  else
    puts "Better luck next time :("
  end
end
