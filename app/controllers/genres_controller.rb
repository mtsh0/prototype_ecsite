class GenresController < ApplicationController
  before_action :set_genre, only: [:edit, :update, :destroy]
  def index
    @genres = Genre.all.page(params[:page])
    set_layout
  end

  def new
    @genre = Genre.new
    set_layout
  end

  def create
    @genre = Genre.create(genre_params)

    if @genre.save
      redirect_to genres_path, success: "ジャンル #{@genre.name} が登録されました"
    else
      render 'new'
    end
    set_layout
  end

  def edit
    set_layout
  end

  def update
    if @genre.update(genre_params)
      redirect_to genres_path, success: "ジャンルが変更されました"
    else
      render 'edit'
    end
    set_layout
  end

  def destroy
    @genre.destroy
    redirect_to genres_path, success: "#{@genre.name} が削除されました"
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

  def set_genre
    @genre = Genre.find(params[:id])
  end

end
