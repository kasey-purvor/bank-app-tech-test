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
    statement = "    date    || credit || debit || balance || time " + "\n" 
    @transactions.each do |trans|
      statement << " #{trans.date} || #{trans.amount} || #{trans.post_transaction_balance} || #{trans.time}" + "\n"
    end 
    p statement 
  end 

  private 

  def record_transaction(amount, post_transaction_balance)
    @transactions << Transaction.new(amount, post_transaction_balance )
  end 

  
end 