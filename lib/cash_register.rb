require 'pry'
class CashRegister
  attr_accessor :total, :discount, :items, :prev_total, :price
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end
  
  def add_item(title, price, multiply = 1)
    if multiply > 1
      count = 0
      while count < multiply
        @items << title
        count += 1
      end
    else
      @items << title
    end
    @price = price
    @prev_total = @total
    @total += (price*multiply)
  end
  
  def apply_discount
    if @discount > 0
      @discount = @discount/100.to_f
      @total = ((1 - @discount) * @total).to_i
      return "After the discount, the total comes to $#{@total}."
    else
      return "There is no discount to apply."
    end
  end
  
  def void_last_transaction
    #binding.pry
    @total -= @price
  end
  
end