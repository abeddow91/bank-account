require 'account.rb'


describe Account do

  subject(:account) {described_class.new}

    it "creates an account with an empty balance" do
      expect(account.balance).to eq(0)
    end

    it "lets the user deposit into account" do
      account.deposit(500)
      expect(account.balance).to eq(500)
    end

    it "lets the user withdraw from account" do
      account.deposit(500)
      account.withdraw(300)
      expect(account.balance).to eq(200)
    end

    it "raises error if user tries to withdraw more than they have available" do
      account1 = Account.new
      expect{account1.withdraw(20)}.to raise_error("Sorry, you have insufficient funds for this withdrawal")
    end

end
