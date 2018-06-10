# applicationcontroller
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_infos
  before_action :request_path
  # bootstrapフラッシュメッセージ用
  add_flash_types :success, :info, :warning, :danger

    def set_infos
      @osirase = Info.order(created_at: :desc).limit(3)
    end

    def request_path
      @path = controller_path + '#' + action_name
      def @path.is(*str)
        str.map{|s| self.include?(s)}.include?(true)
      end
    end

    def set_layout
      if user_signed_in?
        render layout: 'profile_user' and return
      elsif manager_signed_in?
        render layout: 'manager_layout' and return
      end
    end

  # rescue ActionController::RoutingError
  #   logger.error "無効なカート#{params[:id]}にアクセスしようとしました"
  #   redirect_to tops_path, danger: 'アクセスに失敗しました'
  # binding.pry
end
