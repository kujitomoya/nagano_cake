class Public::HomesController < ApplicationController
  def top
    @items = Item.order('id DESC').limit(4)
    @item = Item.all.order(created_at: :desc)
  end

  def about
  end
end