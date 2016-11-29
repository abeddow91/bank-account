class Account

MINIMUM_BALANCE = 0
NOT_APPLICABLE = 0

attr_reader :balance, :account_history

 def initialize
   @balance = MINIMUM_BALANCE
   @account_history = []
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

def print_statement
  deposit_max_length
  withdrawal_max_length
  balance_max_length
  puts(" Date        || Deposit || Withdrawal || Balance ||")
  puts("-------------||#{"-"*@deposit_length}||#{"-"*@withdrawal_length}||#{"-"*@balance_length}||")
  @account_history.each do |transaction|
      puts("#{transaction["date"]}   || #{transaction["deposit"]}#{" "*((@deposit_length-1)-("#{transaction["deposit"]}".length))}|| #{transaction["withdrawal"]}#{" "*((@withdrawal_length-1)-("#{transaction["withdrawal"]}".length))}|| #{transaction["balance"]}#{" "*((@balance_length-1)-("#{transaction["balance"]}".length))}||")
  end
end

def date_max_length
@account_history.each do |transaction|
  set_length(@date_length, transaction["date"] )
end
end

def deposit_max_length
  @deposit_length = 9
    @account_history.each do |transaction|
      length = "#{transaction["deposit"]}".length
      if length > @deposit_length
        @deposit_length = length
      end
  end
end



def withdrawal_max_length
  @withdrawal_length = 12
    @account_history.each do |transaction|
      length = "#{transaction["withdrawal"]}".length
      if length > @withdrawal_length
        @withdrawal_length = length
      end
  end
end


def balance_max_length
  @balance_length = 9
    @account_history.each do |transaction|
      length = "#{transaction["balance"]}".length
      if length > @balance_length
        @balance_length = length
      end
  end
end


end
