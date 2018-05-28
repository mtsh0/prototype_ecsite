class AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_layout, only: [:new]
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  def index
    @addresses = Address.includes(:prefecture).where(user_id: current_user.id)
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.create(address_params)
    if @address.save
      redirect_to addresses_path, success: '登録が完了しました'
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @address.save
      redirect_to addresses_path, success: '1つの住所が削除されました'
    else
      render 'edit'
    end
  end

  def destroy
    @address.destroy
    redirect_to address_path, success: "削除されました"
  end

  private
    def set_address
      @address = Address.find(params[:id])
    end

    def set_layout
      @addresses = Address.where(user_id: current_user.id)
      if @addresses.blank?
        layout 'no_link'
      end
    end

    def address_params
      params.require(:address).permit(:user_id, :user_name, :name_kana, :tel, :postalcode, :prefecture_id, :city, :street, :others)
    end
end
