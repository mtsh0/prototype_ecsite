# applicationcontroller
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  add_flash_types :success, :info, :warning, :danger

  protect_from_forgery with: :exception

  before_action :set_infos

  private

  def set_infos
    @osirase = Info.order(created_at: :desc).limit(3)
  end


end
