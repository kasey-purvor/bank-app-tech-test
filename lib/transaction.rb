class Transaction 
    attr_reader :date, :time, :amount, :post_transaction_balance
  def initialize(amount, post_transaction_balance)
    @time = Time.new.to_s.slice(11,8)
    @date = Time.new.to_s.slice(0,10) 
    @amount = amount
    @post_transaction_balance = post_transaction_balance
  end 

  
end 