class Account

BALANCE = 0
NOT_APPLICABLE = 0

attr_reader :balance, :account_history

 def initialize
   @balance = BALANCE
   @account_history = []
 end

def deposit(amount)
  @balance+= amount
  add_transaction_to_history(amount,NOT_APPLICABLE,@balance)
  print_current_balance
end

def withdraw(amount)
  new_balance = @balance-amount
  raise "Sorry, you have insufficient funds for this withdrawal" if new_balance < 0
  @balance = new_balance
  add_transaction_to_history(NOT_APPLICABLE,amount,@balance)
  print_current_balance
end

def print_current_balance
  print "Thank you. Your balance is now #{@balance}."
end

def date_calculator
  t = Time.now
  @date = t.strftime('%d/%m/%Y')
end

def add_transaction_to_history(deposit, withdrawal, balance)
  date_calculator
  @account_history << {date: @date, deposit: deposit, withdrawal: withdrawal, balance: balance}
end

end
