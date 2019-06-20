
require 'pry'

class CashRegister

  attr_accessor :discount, :total, :item, :last_transaction_amount

  def initialize(discount = nil)
    @total = 0.to_f
    @discount = discount.to_f
    @item = []
  end

  def add_item(item, price, qty = nil)
    if qty != nil
        @last_transaction_amount = price * qty
        counter = 0
        while counter < qty
        @item << item
        counter += 1
        end
        self.total += price * qty
      else
        @last_transaction_amount = price
        @item << item
        self.total += price
    end
    # @last_transaction
  end

  def apply_discount
    if self.discount != 0
      self.total = self.total * (1 - (self.discount/100))
      "After the discount, the total comes to $#{self.total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    self.item
  end

  def void_last_transaction
    self.total -= @last_transaction_amount
  end

end


cash = CashRegister.new
cash.add_item("orange", 2, 3)
cash.items
cash.add_item("tomato", 0.5)
cash.items

cash.void_last_transaction
