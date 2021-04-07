RSpec.describe Account do 
  context ": Set up behaviour:" do 
    it 'contains an initial balance of 0 pounds ' do 
      expect(subject.balance).to eq(0)
    end 

    it 'accepts an optional user name as input upon initialization' do 
      account = Account.new('test_name')
      expect(account.name).to eq('test_name')
    end 

    it 'assigns "Anonamous User" as the name if no name is given upon initialization' do 
      expect(subject.name).to eq("Anonamous User")
    end 

    it "contains an empty array of transactions" do 
      expect(subject.transactions).to be_empty
    end 
  end 

  context ': normal operation:' do 
    it 'allows the user to deposit money' do 
      subject.deposit(100)
      expect(subject.balance).to eq(100)
    end 

    it 'allows the user to withdraw money' do 
      deposit_100_withdraw_99
      expect(subject.balance).to eq(1)
    end 

    it 'prevents ther user from going overdrawn' do 
      expect{subject.withdraw(100)}.to raise_error("Insufficient Balance")
    end 

    it 'correctly creates a transaction object when a withdrawal or deposit is made' do 
      deposit_100_withdraw_99
      expect(subject.transactions.size).to eq(2)
      expect(subject.transactions[0].amount).to eq(100)
      expect(subject.transactions[1].amount).to eq(-99)
      print subject.statement
    end 

    it 'can display the transation history in a statement' do 
      deposit_100_withdraw_99
      expect(subject.statement).to include("100", "99", "1")
    end

    it 'can display the statement in the correct format with the correct collumn spacing' do 
      deposit_100_withdraw_99
      expect(subject.statement).to match(/\d{12}||\d{8}||\d{9}||\d{12}/)
    end 


  end 
end 