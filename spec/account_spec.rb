require 'account.rb'


describe Account do

  subject(:account) {described_class.new}

    it "creates an account with an empty balance" do
      expect(account.balance).to eq(0)
    end

    it "lets the user deposit 500 into account" do
      account.deposit(500)
      expect(account.balance).to eq(500)
    end
end
