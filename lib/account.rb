class Account 
  attr_reader :balance, :name, :transactions 

  def initialize(name = 'Anonamous User')
    @name = name 
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    record_transaction(amount, (@balance + amount)) #positive value here due to deposit 
    @balance += amount
    #will put statement method call here
  end 

  def withdraw(amount)
    fail 'Insufficient Balance' if @balance < amount
    record_transaction(-amount, (@balance - amount)) # minus value here due to withdrawal 
    @balance -= amount 
    #will put statement method call here 
  end 

  def statement 
    statement = "Date".center(12) + '||' + "Credit".center(9) + '||' + "debit".center(9) + '||' + "Balance".center(10) + '||' + "Time".center(10) + "\n"
    @transactions.each do |trans|
      statement << "#{trans.date.center(12)}||#{trans.credit_or_debit}||#{trans.post_transaction_balance.to_s.rjust(9)} ||#{trans.time.center(10)} \n"
    end 
    print statement   
    return statement
  end 

  private 
 
  def record_transaction(amount, post_transaction_balance)
    @transactions << Transaction.new(amount, post_transaction_balance )
  end 

  
end 