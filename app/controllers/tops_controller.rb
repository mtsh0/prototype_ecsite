class TopsController < ApplicationController
  before_action :set_search, only: [:index, :search]

  def how_to_use; end

  def q_and_a; end

  def index


    @newItems = Item.order(updated_at: :desc).limit(4)
    @infos = Info.order(created_at: :desc).limit(3)
    @genres = Genre.all.includes(:subgenre)
    @genre1Items = Item.where(genre_id: 1).order(updated_at: :desc).limit(4)
    @genre2Items = Item.where(genre_id: 2).order(updated_at: :desc).limit(4)
    @genre3Items = Item.where(genre_id: 3).order(updated_at: :desc).limit(4)

    unless @q.blank?
      @search_items = @q.result(distinct: true)
    end
  end



  def company
    @places = Position.all
    @hash = Gmaps4rails.build_markers(@places) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      marker.infowindow place.title + '(' + place.description + ')'
      # marker.infowindow
    end
  end

  def genre
    # binding.pry
    @items = Item.where(genre_id: params[:id]).page(params[:page]).per(12)
    @genre = Genre.find_by(id: params[:id])
    # binding.pry
  end

  def subgenre
    @items = Item.where(genre_id: params[:genre_id], subgenre_id: params[:subgenre_id]).page(params[:page]).per(12)
    @subgenre = Subgenre.find_by(id: params[:subgenre_id])
    # binding.pry
  end

  def search
    @search_items = @q.result(distinct: true)
    @count_items = @search_items.size
  end

  def set_search
    @q = Item.search(params[:q])
  end
end
