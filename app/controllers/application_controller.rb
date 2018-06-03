# applicationcontroller
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # bootstrapフラッシュメッセージ用
  add_flash_types :success, :info, :warning, :danger


  before_action :set_infos



  def set_infos
    @osirase = Info.order(created_at: :desc).limit(3)
  end

  def set_layout
    if user_signed_in?
      render layout: 'profile_user' and return
    elsif manager_signed_in?
      render layout: 'manager_layout' and return
    end
  end

end
