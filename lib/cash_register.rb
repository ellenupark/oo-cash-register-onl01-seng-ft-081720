require 'pry'

class CashRegister
    attr_accessor :total, :discount, :title, :price, :items, :previous_item

    def initialize(discount = 0)
        @total = 0 
        @discount = discount
        @items = []
        @previous_item = []
    end

    def add_item(title, price, quantity = 1)
        @title = title
        @price = price
        @total += quantity * price
        count = 1
        while count <= quantity
            @items << title
            count += 1
        end
        @previous_item << self
    end

    def apply_discount
        discount_amount = @total * (@discount * 0.01)
        @total -= discount_amount
        if @discount == 0
            "There is no discount to apply."
        else
            "After the discount, the total comes to $#{@total.to_int}."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        @items.pop
        @total -= @previous_item[-1].price
        @previous_item.pop
        if @previous_item.length < 1
            @total = 0.0
        end
    end
end