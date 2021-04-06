RSpec.describe Account do 
  context "Set up behaviour" do 
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

end 