class CashRegister

  attr_accessor :total, :discount, :list

  def initialize(discount=0,total=0)
    @total = total
    @discount = discount
    @list = {}
  end

  def add_item (name, price, quantity = 1)
    @list[name]= [price, quantity]
    @total += (quantity*price)
  end

  def apply_discount
    if discount > 0
      discount_total=(@discount*@total/100)
      @total -= discount_total
      "After the discount, the total comes to $#{total}."
    else
      "There is no discount to apply."
    end
  end

 def items
    new_list=[]
    @list.each {|key, value| value[1].times {new_list << key}}
    new_list
 end

 def void_last_transaction
  last_item=@list.to_a.pop.flatten
  @total -= last_item[1] * last_item[2]
  end 
end
