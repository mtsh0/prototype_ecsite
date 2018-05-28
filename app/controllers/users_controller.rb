class UsersController < ApplicationController
  before_action :authenticate_user!


  def index
    @orders = Order.where(user_id: current_user.id).reverse_order
    set_user_profilelayout
  end

  def show

    @user = User.find( current_user.id)
    set_user_profilelayout
  end


end
