# transaction Class. Stores each transactions data and the balance at the time after the transaction
class Transaction
  attr_reader :date, :time, :amount, :post_transaction_balance

  def initialize(amount, post_transaction_balance)
    @time = Time.new.to_s.slice(11, 8)
    @date = Time.new.to_s.slice(0, 10)
    @amount = amount
    @post_transaction_balance = post_transaction_balance
  end

  # this method generates the transaction ammount into debit/credit collumns for the statement.
  def credit_or_debit
    return "         ||#{(@amount * -1).to_s.rjust(8)} " if @amount < 0
    return "#{@amount.to_s.rjust(8)} ||         " if @amount > 0
  end
  
end