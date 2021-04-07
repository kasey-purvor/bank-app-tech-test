RSpec.describe Transaction do 
  context ':setup behaviour:' do 
    it "records the date and time upon creation in the correct format" do 
      transaction = Transaction.new(100,100)
      expect(transaction.date).not_to be_empty 
      expect(transaction.time).not_to be_empty
      expect(transaction.time).to match(/\d{2}:\d{2}:\d{2}/) #checking format is XX:XX:XX
      expect(transaction.date).to match (/\d{4}-\d{2}-\d{2}/) #check format is XXXX-XX-XX
    end 

    it "accepts an amount, and the account balance as arguments upon initialization " do 
      transaction = Transaction.new(100, 100)
      expect(transaction.amount).to eq(100)
      expect(transaction.post_transaction_balance).to eq(100)
    end 
  end

  context ':normal operational:' do 
    it 'format itself into either credit or debit for statement printing' do 
      deposit = Transaction.new(100, 100)
      withdrawal = Transaction.new(-50, 50)
      expect(deposit.credit_or_debit).to eq("     100 ||         ") #long whitespace is 9 characters.
      expect(withdrawal.credit_or_debit).to eq("         ||      50 ") # long whitespace is 9 chars
    end 
  end 
end 