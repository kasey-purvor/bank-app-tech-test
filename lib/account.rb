require_relative './transaction'
# Account class. Stores thew account data:( name, balance, transactions) and creates a
# statement when called which diplays the transactions history with relavent data.
class Account
  attr_reader :balance, :name, :transactions

  def initialize(name = 'Anonamous User')
    @name = name
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    record_transaction(amount, (@balance + amount)) # positive value here due to deposit
    @balance += amount
    statement
  end

  def withdraw(amount)
    overdrawn?(amount)
    record_transaction(-amount, (@balance - amount)) # minus value here due to withdrawal
    @balance -= amount
    statement
  end

  def statement
    statement = statement_header
    # iterates through the transactions and formats the data into a statement
    @transactions.each do |trans|
      statement << "#{trans.date.center(12)}||#{trans.credit_or_debit}||#{trans.post_transaction_balance.round(2).to_s.rjust(9)} ||#{trans.time.center(10)} \n"
    end
    print statement
    return statement
  end

  

  # checks to see if balance is avaliable
  def overdrawn?(amount)
    raise 'Insufficient Balance' if @balance < amount
  end

  # adds the deposit/withdrawal amount plus the updated balance to the transactions array
  def record_transaction(amount, post_transaction_balance)
    @transactions << Transaction.new(amount, post_transaction_balance)
  end

  # stores the statement header
  def statement_header
    "Date".center(12) + '||' + "Credit".center(9) + '||' + "debit".center(9) + '||' + "Balance".center(10) + '||' + "Time".center(10) + "\n" + "=" * 58 + "\n"
  end

end
