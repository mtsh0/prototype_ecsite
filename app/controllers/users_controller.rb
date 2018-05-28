class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    layout 'profile_user'
    @user = User.find(id: current_user.id)
  end
end
