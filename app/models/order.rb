class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: {
     waiting:0, confirmation:1, production:2, preparation:3, complete:4
  }
  
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  
   has_one_attached :image
   

 def address_all
  '〒' + postal_code + ' ' + address + ' ' + name
 end
end