class ItemsController < ApplicationController

  before_action :set_item, except: [:new, :create, :index]

  def index
    @items = Item.all.page(params[:page])
    set_layout
  end

  def new
    @item = Item.new
    set_layout
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to new_item_path, success: "#{@item.itemName}登録が完了しました"
    else
      render 'new'
    end
    set_layout
  end

  def show;
    set_layout
  end

  def edit;
    set_layout
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item), success: "変更しました"
    else
      render 'edit'
    end
    set_layout
  end

  def destroy
    if @item.destroy
      redirect_to items_path, success: "商品名：#{@item.itemName} を削除しました"
    end
  end

  def preview
    @item = Item.find(params[:id])
    # @cartitem = Cartitem.new(cartitem_params)
    @cartitems = Cartitem.all

  end

  private
  def item_params
    params.require(:item).permit(:itemCodeNo, :partNumber, :itemName, :genre_id, :topDispflg, :description, :attention, :price, :mainImage, :mainImage_cache, :image2, :image2_cache, :remove_image2, :image3, :image3_cache, :remove_image3)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  # def cartitem_params
  #   params.require(:cartitem).permit(:quantity, :item_id, :user_id)
  # end
end
