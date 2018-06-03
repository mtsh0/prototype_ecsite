class UsersController < ApplicationController
  before_action :authenticate_user!


  def index
    @orders = Order.where(user_id: current_user.id).page(params[:page]).reverse_order
    set_layout
  end

  def show

    @user = User.find( current_user.id)
    set_layout
  end
end
