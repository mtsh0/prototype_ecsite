class TopController < ApplicationController
  def index
    @newItems = Item.order(updated_at: :desc).limit(4)
    @infos = Info.order(created_at: :desc).limit(3)
  end

  def contact; end

  def company
    @places = Position.all
    @hash = Gmaps4rails.build_markers(@places) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      marker.infowindow place.title + " (" + place.description + ")"
      # marker.infowindow

    end
  end
end
