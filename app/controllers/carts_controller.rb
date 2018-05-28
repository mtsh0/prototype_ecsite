class CartsController < ApplicationController
  # before_action :set_cartitems, only: [:add_item]
  def index
    @cartitems = Cartitem.includes(:item).where(order_id: nil,user_id: current_user.id)

    @totalcount = 0
    @totalprice = 0
    @cartitems.each do |cartitem|
      @totalcount += cartitem.quantity
      @totalprice += (cartitem.quantity * cartitem.item.price)
    end



  end

  def add_item
      @cartitem =Cartitem.new(cartitem_params)
      @checkcartitem = Cartitem.find_by(item_id: @cartitem.item_id, user_id: current_user.id)
      # binding.pry

      if @checkcartitem.blank?
        @cartitem.save
        # binding.pry
        redirect_to carts_path, success: "#{@cartitem.item.itemName}がカートに追加されました"
      else
        @checkcartitem.update_columns(quantity: (@checkcartitem.quantity + @cartitem.quantity))
        @checkcartitem.save
        # binding.pry
        redirect_to carts_path, success: "#{@checkcartitem.item.itemName}がカートに追加されました"
      end
  end

  private

  # def set_cartitems
  #   # @cartitem = Cartitem.new
  #   @cartitem = current_user.cartitems.find_by(item_id: params[:item_id])
  #   binding.pry
  # end

  def cartitem_params
    params.permit(:quantity, :item_id, :user_id)
  end
end
