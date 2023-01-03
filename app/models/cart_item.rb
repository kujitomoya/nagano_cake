class CartItem < ApplicationRecord
   belongs_to :customer
   belongs_to :item
   
    has_one_attached :image
    
    def stock_array_maker(current_stock)
      current_stock < 10 ? [*1..current_stock] : [*1..10]
    end
  
    def subtotal
    item.with_tax_price * amount
    end
end