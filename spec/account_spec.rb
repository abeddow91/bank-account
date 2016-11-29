require 'account.rb'

describe Account do
    it "creates an account with an empty balance" do
      @account = Account.new
      expect(@account.balance).to eq(0)
  end
end
