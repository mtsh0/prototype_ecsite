class TopController < ApplicationController
  def index
    @newItems = Item.order(updated_at: :desc).limit(4)
    @infos = Info.order(created_at: :desc).limit(3)
  end

  def contact; end

  def company; end
end
