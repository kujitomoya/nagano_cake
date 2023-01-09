class Admin::OrderDetailsController < ApplicationController
  def update
  
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details
    
     @order_detail.update(order_detail_params)
     if @order_details.where(production_status: 2).count >= 1
       @order.update(status: 2)
     end
     if @order.order_details.count == @order_details.where(production_status: 3).count
       @order.update(status: 3)
     end
      
      # is_updatedがtrueの場合に、注文ステータスが「発送準備中」に更新されます。上記のif文でis_updatedがfalseになっている場合、更新されません。
    
    redirect_to admin_order_path(@order)
  end
  
  private
   
   def order_detail_params 
     params.require(:order_detail).permit(:production_status)
   end
end