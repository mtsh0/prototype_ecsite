class AddressesController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_address, only: [:edit, :update, :destroy]

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

  def show
    binding.pry
    @address = Address.find_by(user_id: current_user.id)
  end

  def edit; end

  def update
    @address.update(address_params)
    if @address.save
      redirect_to address_path, success: '住所が変更されました'
    else
      render 'edit'
    end
  end

  def destroy
    @address.destroy
    redirect_to addresses_path, success: '削除されました'
  end

  def first_new
    @address = Address.new
    render layout: 'no_link'
  end

  def first_create
    @address = Address.create(address_params)
    if @address.save
      redirect_to root_path, success: '配送先住所の登録が完了しました'
    else
      render 'first_new'
      # layout 'no_link'
      # render layout: 'no_link' and return
      # redirect_to first_new_addresses_path
    end
  end

  private

  def set_address
    @address = Address.find_by(user_id: current_user.id)
  end

  def address_params
    params.require(:address).permit(:user_id, :user_name, :name_kana, :tel, :postalcode, :prefecture_id, :city, :street, :others)
  end
end
