class Account

MINIMUM_BALANCE = 0
NOT_APPLICABLE = 0
DEPOSIT_WORD_LENGTH = 9
WITHDRAWAL_WORD_LENGTH = 12
BALANCE_WORD_LENGTH = 9

attr_reader :balance, :account_history

 def initialize
   @balance = MINIMUM_BALANCE
   @account_history = []
   @deposit_length = DEPOSIT_WORD_LENGTH
   @withdrawal_length = WITHDRAWAL_WORD_LENGTH
   @balance_length = BALANCE_WORD_LENGTH
 end

def deposit(amount)
  @balance+= amount
  add_transaction_to_history(amount,NOT_APPLICABLE,@balance)
  print_current_balance
end

def withdraw(amount)
  raise "Sorry, you have insufficient funds for this withdrawal" if (@balance-amount) < MINIMUM_BALANCE
  @balance-=amount
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
  @account_history << {"date" => @date, "deposit" => deposit, "withdrawal" => withdrawal, "balance" => balance}
end

def print_header
  set_max_length
  puts(" Date        || Deposit || Withdrawal || Balance ||")
  puts("-------------||#{dash_amount(@deposit_length)}||#{dash_amount(@withdrawal_length)}||#{dash_amount(@balance_length)}||")
end

def print_statement
  print_header
  @account_history.each do |transaction|
      puts("#{transaction["date"]}   || #{white_space(@deposit_length, transaction["deposit"])}|| #{white_space(@withdawal_length, transaction["withdrawal"])}|| #{white_space(@belance_length, transaction["balance"])}||")
  end
end

def check_max_length(max_length, variable)
    @account_history.each do |transaction|
      string = transaction[variable]
      if "#{string}".length > max_length
        max_length  = "#{string}".length
      end
  end
end

def set_max_length
  check_max_length(@deposit_length, "deposit")
  check_max_length(@withdrawal_length, "withdrawal")
  check_max_length(@balance_length, "balance")
end

def dash_amount(length)
  dash_space = ("-"*length)
end

def white_space(variable_length, variable)
  white_space = (" "*((variable_length-1)-("#{variable}".length)))
  "#{variable}#{white_space}"
end

end
