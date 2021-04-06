class Transaction 
    attr_reader :date, :time, :amount  
  def initialize(amount = 0)
    @time = Time.new.to_s.slice(11,8)
    @date = Time.new.to_s.slice(0,10) 
    @amount = amount
  end 
end 