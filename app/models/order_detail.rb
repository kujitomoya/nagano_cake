class OrderDetail < ApplicationRecord
  enum making_status: {
     production_not_possible:0, production_pending:1, in_production:2, production_complete:3,
  }
   belongs_to :order
   belongs_to :item
   
    has_one_attached :image
    
    def subtotal
      item.with_tax_price * amount
    end
end