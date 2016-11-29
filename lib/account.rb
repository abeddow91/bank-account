class Account

BALANCE = 0

attr_reader :balance

 def initialize
   @balance = BALANCE
 end

def deposit(amount)
  @balance+= amount
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

end
