class OrdersController < ApplicationController
  before_action :set_cartitems, only: [:new, :create, :pay]
  protect_from_forgery except: :pay

  def index
    @orders = Order.where(user_id: current_user.id).reverse_order
  end

  def show
    @order = Order.find(params[:id])
    @cartitems = Cartitem.includes(:item).where(order_id: @order.id)
    @address = Address.find_by(user_id: current_user.id)
    @total_count = 0
    @total_price = 0
    @cartitems.each do |cartitem|
      @total_count += cartitem.quantity
      @total_price += cartitem.quantity * cartitem.item.price
    end
    # binding.pry
  end

  def new
    # ユーザーの住所idを渡す
    @address = Address.find_by(user_id: current_user.id)
  end

  def create; end


  def pay
    # クレジット決済
    # binding.pry
    Payjp.api_key = 'sk_test_5856604ca5d22e70cf473d39'

    # Pay::Token.new

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

    # binding.pry
    # クレジット決済による売上登録(payjp)
    charge = Payjp::Charge.create(
        :amount => @total_price,
        :card => token.id,
        :currency => 'jpy'
    )

    # binding.pry

    # 注文の保存
    @order = Order.new(order_params)

    # 注文番号の作成
    # 現在時刻の取得
    t = Time.current
    current_day = t.strftime("%y%m%d")

    # 最後の注文の注文番号取得
    @last_order = Order.select("order_no").last
    order_no = @last_order.order_no
    # binding.pry

    # 注文日を確認して番号の割り振り
    if((order_no == nil) || (order_no.start_with?(current_day) == false))
      # 当日の注文がまだない場合
      @order.order_no = ("#{current_day}" + "001")
    else
      # 当日の注文がすでにある場合
      @order.order_no = ((@last_order.order_no).to_i + 1).to_s
    end

    @order.user_id = current_user.id
    @order.total_price = @total_price
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
    end

  # payjpのカード情報登録エラー時の処理
  rescue Payjp::CardError
    flash.now[:danger] = 'カードエラーが発生しました。もう一度ご確認ください'
    render 'new'
  end

  private
  def set_cartitems
    # カートに入っている商品を全て渡す
    @cartitems = Cartitem.includes(:item).where(order_id: nil ,user_id: current_user.id)

    # カート内の数量、金額の計算
    @total_count = 0
    @total_price = 0
    @cartitems.each do |cartitem|
      @total_count += cartitem.quantity
      @total_price += ((cartitem.item.price) * (cartitem.quantity)).to_i
    end
  end

  def order_params
    params.permit(:order_no, :user_id, :total_price, :address_id, :dvendor_id, :d_number)
  end
end
