RSpec.describe Transaction do 
  context 'setup behaviour' do 
    it "records the date and time upon creation in the correct format" do 
      transaction = Transaction.new
      expect(transaction.date).not_to be_empty 
      expect(transaction.time).not_to be_empty
      expect(transaction.time).to match(/\d{2}:\d{2}:\d{2}/) #checking format is XX:XX:XX
      expect(transaction.date).to match (/\d{4}-\d{2}-\d{2}/) #check format is XXXX-XX-XX
    end 

    it "accepts an amount (with a default of 0) as an argument upon initialization " do 
      expect(subject.amount).to eq(0)
      transaction = Transaction.new(100)
      expect(transaction.amount).to eq(100)
    end 


  end 
end 