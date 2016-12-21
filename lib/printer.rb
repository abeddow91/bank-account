class Account

MINIMUM_BALANCE = 0
NOT_APPLICABLE = 0
DEPOSIT_WORD_LENGTH = 9
WITHDRAWAL_WORD_LENGTH = 12
BALANCE_WORD_LENGTH = 9

attr_reader :account_history

def initialize
  @deposit_length = DEPOSIT_WORD_LENGTH
  @withdrawal_length = WITHDRAWAL_WORD_LENGTH
  @balance_length = BALANCE_WORD_LENGTH
end

def print_current_balance
  print "Thank you. Your balance is now #{@balance}."
end

def print_statement
  finalize_length

  puts(" Date        || Deposit || Withdrawal || Balance ||")
  puts("-------------||#{"-"*@deposit_length}||#{"-"*@withdrawal_length}||#{"-"*@balance_length}||")
  @account_history.each do |transaction|
      puts("#{transaction["date"]}   || #{transaction["deposit"]}#{" "*((@deposit_length-1)-("#{transaction["deposit"]}".length))}|| #{transaction["withdrawal"]}#{" "*((@withdrawal_length-1)-("#{transaction["withdrawal"]}".length))}|| #{transaction["balance"]}#{" "*((@balance_length-1)-("#{transaction["balance"]}".length))}||")
  end
end

def finalize_length
  calculate_max_length(@deposit_length, "deposit")
  calculate_max_length(@withdrawal_length, "withdrawal")
  calculate_max_length(@balance_length, "balance")
end



def calculate_max_length(max_length, variable)
    @account_history.each do |transaction|
      string = transaction[variable]
      if "#{string}".length > max_length
        max_length  = "#{string}".length
      end
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
