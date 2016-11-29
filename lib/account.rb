class Account

BALANCE = 0

attr_reader :balance, :deposit_history

 def initialize
   @balance = BALANCE
   @deposit_history = []
 end

def deposit(amount)
  @balance+= amount
  date_calculator
  @deposit_history << {date: @date, deposit: amount}
  print_current_balance
end

def withdraw(amount)
  new_balance = @balance-amount
  raise "Sorry, you have insufficient funds for this withdrawal" if new_balance < 0
  @balance = new_balance
  print_current_balance
end

def print_current_balance
  print "Thank you. Your balance is now #{@balance}."
end

def date_calculator
  t = Time.now
  @date = t.strftime('%d/%m/%Y')
end

end
