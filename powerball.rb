class Powerball
  attr_reader :num_combos

  PAYOUTS = {
    '0+': { value: 4, odds: 38.32 },
    '1+': { value: 4, odds: 91.98 },
    '2+': { value: 7, odds: 701.33 },
    '3': { value: 7, odds: 579.76 },
    '3+': { value: 100, odds: 14_494.11 },
    '4': { value: 100, odds: 36_525.17 },
    '4+': { value: 50_000, odds: 913_129.18 },
    '5': { value: 1_000_000, odds: 11_688_053.52 },
    '5+': { value: 40_000_000, odds: 292_201_338.00 }
  }
  def initialize(jackpot = nil)
    @jackpot = taxed(lumped(jackpot || PAYOUTS[:'5+'][:value]))
    @num_combos = calculate_num_combos
  end

  def average_ticket_value
    winnings = 0

    PAYOUTS.each do |key, info|
      if key == :'5+'
        winnings += @jackpot
      else
        outcome = (info[:value] * (@num_combos / info[:odds]))
        outcome = taxed(outcome) if info[:value] > 100
        winnings += outcome
      end
    end

    winnings / @num_combos
  end

  def evaluate(pick, winner)
    payout_key = (pick[0] & winner[0]).length.to_s
    payout_key += '+' if pick[1] == winner[1]

    if %w(0 1 2).include?(payout_key)
      0
    elsif payout_key == '5+'
      @jackpot
    else
      amount = PAYOUTS[payout_key.to_sym][:value]
      amount > 100 ? taxed(amount) : amount
    end
  end

  def format_num(num)
    num.gsub(/(\d)(?=\d{3}+(?:\.|$))(\d{3}\..*)?/, '\1,\2')
  end

  def lumped(num)
    num * 0.62
  end

  def pick_nums
    nums = (1..69).to_a
    picks = nums.sample(5)
    [picks, (rand(26) + 1)]
  end

  def simulator(num_tix)
    winner = pick_nums
    wins = winnings = max_win = 0

    num_tix.times do
      this_pick = pick_nums
      result = evaluate(this_pick, winner)
      next if result <= 0

      winnings += result
      wins += 1
      max_win = [result, max_win].max
    end
    cost = num_tix * 2
    {
      attempts: num_tix,
      wins: wins,
      max_win: max_win,
      winnings: winnings,
      outcome: winnings - cost
    }
  end

  def taxed(num)
    num * 0.614
  end

  private

  def calculate_num_combos
    n = 69
    r = 5
    pb = 26

    factorial(n) * pb / (factorial(r) * factorial(n - r))
  end

  def factorial(n)
    total = 1

    until n == 0
      total *= n
      n -= 1
    end

    total
  end
end
