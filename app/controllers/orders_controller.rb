class OrdersController < ApplicationController
  before_action :set_cartitems, only: [:new, :create, :pay]

  protect_from_forgery except: :pay

  def index
    @orders = Order.all.page(params[:page]).reverse_order
    set_layout
  end

  def show
    @order = Order.find(params[:id])
    @cartitems = Cartitem.includes(:item).where(order_id: @order.id)
    @address = Address.find_by(user_id: @order.user_id)
    @total_count = 0
    @total_price = 0
    @cartitems.each do |cartitem|
      @total_count += cartitem.quantity
      @total_price += cartitem.quantity * cartitem.item.price
    end

    set_layout
  end

  def new; end

  def create; end

  def edit
    @order = Order.find(params[:id])
    @submit = '登録する'
    set_layout
  end

  def update
    @order = Order.find(params[:id])

    if @order.update(update_trackable_params)
      redirect_to order_path(@order), success: "#{@order.order_no}の配送状況が登録されました"
    else
      render 'edit'
    end
  end

  def pay
    # クレジット決済
    Payjp.api_key = 'sk_test_5856604ca5d22e70cf473d39'

    # クレジット決済(payjp)用のトークン作成
    token = Payjp::Token.create(
      :card => {
        number: params[:number],
        cvc: params[:cvc],
        exp_month: params[:exp_month],
        exp_year: params[:exp_year],
        name: params[:name]
      }
    )

    # クレジット決済による売上登録(payjp)
    Payjp::Charge.create(
        :amount => @total_price,
        :card => token.id,
        :currency => 'jpy'
    )

    # 注文の保存
    @order = Order.new(order_params)

    # 注文番号の作成
    # 現在時刻の取得
    t = Time.current
    current_day = t.strftime("%y%m%d")

    # 最後の注文の注文番号取得
    @last_order = Order.select("order_no").last

    unless @last_order.blank?
      order_no = @last_order.order_no
    end

    # 注文日を確認して番号の割り振り
    if((@last_order == nil) || (order_no.start_with?(current_day) == false))
      # 当日の注文がまだない場合
      @order.order_no = ("#{current_day}" + "001")
    else
      # 当日の注文がすでにある場合
      @order.order_no = ((@last_order.order_no).to_i + 1).to_s
    end

    @order.user_id = current_user.id
    @order.total_price = @total_price.to_s
    @address = Address.find_by(user_id: current_user.id)
    @order.address_id = @address.id


    if @order.save
      # 注文完了、カートの商品を注文レコードに紐付ける
      @cartitems.each do |cartitem|
        cartitem.user_id = nil
        cartitem.order_id = @order.id
        cartitem.save
      end
      redirect_to order_path(@order), success: '注文が完了しました。お買い上げいただきありがとうございました'
    else
      flash.now[:danger] = 'エラー1'
      render 'new'
    end

  # payjpのカード情報登録エラー時の処理
  rescue Payjp::CardError
    flash.now[:danger] = 'カード情報が確認できませんでした。もう一度確認の上入力してください'
    render 'orders/new'
  end

  private
  def set_cartitems
    # カートに入っている商品を全て渡す
    @cartitems = Cartitem.includes(:item).where(order_id: nil ,user_id: current_user.id)

    # カート内の数量、金額の計算
    @total_count = 0
    @total_price = 0
    @cartitems.each do |cartitem|
      @total_count += cartitem.quantity.to_i
      @total_price += ((cartitem.item.price).to_i * (cartitem.quantity)).to_i
    end
  end

  def order_params
    params.permit(:order_no, :user_id, :total_price, :address_id, :dvendor_id, :d_number)
  end

  def update_trackable_params
    params.require(:order).permit(:order_no, :user_id, :total_price, :address_id, :dvendor_id, :d_number)
  end
end
