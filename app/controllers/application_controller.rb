# applicationcontroller
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  add_flash_types :success, :info, :warning, :danger

  protect_from_forgery with: :exception

  before_action :set_infos



  def set_infos
    @osirase = Info.order(created_at: :desc).limit(3)
  end

  def set_user_profilelayout
    render layout: 'profile_user'
  end


  def after_sign_in_path_for(resource_or_scope)
    @addresses = Address.where(user_id: current_user.id)
    if @addresses.blank?
      new_address_path
    else
      # users_path
      root_path
    end
  end

end
