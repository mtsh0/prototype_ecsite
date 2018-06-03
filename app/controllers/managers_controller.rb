class ManagersController < ApplicationController
  before_action :authenticate_manager!
  layout 'manager_layout'
  def index; end

  def show; end

  def dashboard; end
end
