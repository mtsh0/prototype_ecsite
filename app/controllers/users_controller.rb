class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_layout

  def index
    @orders = Order.where(user_id: current_user.id).reverse_order
  end

  def show
    @user = User.find(id: current_user.id)
  end

  def set_layout
    layout 'profile_user'
  end
end
