class ItemsController < ApplicationController

  before_action :set_item, except: [:new, :create, :index]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item), success: "登録が完了しました"
    else
      render 'new'
    end


  end

  def index
    @items = Item.all.page(params[:page])
  end

  def show; end

  def edit;end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item), notice: "変更しました"
    else
      render 'edit'
    end
  end

  def destroy
    if @item.destroy
      redirect_to items_path, success: "商品名：#{@item.itemName} を削除しました"
    end
  end

  def preview
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:itemCodeNo, :partNumber, :itemName, :genre_id, :topDispflg, :description, :attention, :price, :shippingUnit, :mainImage, :mainImage_cache, :image2, :image2_cache, :remove_image2, :image3, :image3_cache, :remove_image3)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
