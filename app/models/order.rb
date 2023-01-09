class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: {
     "入金待ち":0, "入金確認":1, "製作中":2, "発送準備中":3, "発送済":4
  }
  
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  
   has_one_attached :image
   

 def address_all
  '〒' + postal_code + ' ' + address + ' ' + name
 end
end