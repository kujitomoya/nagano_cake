class Public::ItemsController < ApplicationController
   before_action :authenticate_customer!, except: [:index]
  def index
    @items = Item.all.page(params[:page]).per(8)
    @item = current_customer
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
   private
   
   def item_params
     params.require(:item).permit(:genre_id,:name,:introduction,:price,:is_active)
   end
end