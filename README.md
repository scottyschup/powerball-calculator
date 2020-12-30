# Powerball Calculator

With the Powerball jackpot reaching a record-breaking $1.5B, you may be tempted to spend more money than you should on the lottery. This calculator is here to help you realize how silly this would be.

### Usage
- Open your terminal and navigate to the directory where you want to download the Powerball Calculator repo.
- Clone the repo 
  ```sh
  git clone https://github.com/scottyschup/powerball-calculator
  ```
- `cd` into the repo
  ```sh
  cd powerball-calculator
  ```
- Run `ruby calculator.rb` and follow the prompt to see the total possible prize amount and average ticket value (assuming you buy one of each).
- Run `ruby simulator.rb` and follow the prompts to simulate the thrill of buying large amounts of lottery tickets.

### Miscellany
Note that if you do win the jackpot, I've assumed you would take the lump sum (which is about 38% less than the annuitized amount). I've also only accounted for federal taxes (39.6%) as some states (e.g. California) don't tax lottery winnings. But most states do tax lottery winnings somewhere around 4% to 9%. So keep that in mind before you start shopping for your next mansion and/or yacht.

The more tickets you "buy", the longer it takes, just FYI. Buying more than 250,000 tickets at a time will take noticeably longer to calculate. 10,000,000 feels like it takes forever (but really it's like 45 seconds).
