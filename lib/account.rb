class Account 
  attr_reader :balance, :name, :transactions 

  def initialize(name = 'Anonamous User')
    @name = name 
    @balance = 0
    @transactions = []
  end




end 