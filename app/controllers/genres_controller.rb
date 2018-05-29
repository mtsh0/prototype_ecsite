class GenresController < ApplicationController
  before_action :set_genre, only: [:edit, :update, :destroy]
  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.create(genre_params)

    if @genre.save
      redirect_to genres_path, success: "ジャンル #{@genre.name} が登録されました"
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @genre.update(genre_params)
      redirect_to genres_path, success: "ジャンルが変更されました"
    else
      render 'edit'
    end
  end

  def destroy
    @genre.destroy
    redirect_to genres_path, success: "#{@genre.name} が削除されました"
  end

  def genre1
    @items = Item.where(genre_id: 1)
  end

  def genre1_1

  end

  def genre1_2

  end

  def genre1_3

  end

  def genre1_4

  end

  def genre2
    @items = Item.where(genre_id: 2)
  end

  def genre2_1

  end

  def genre2_2

  end

  def genre2_3

  end

  def genre2_4

  end

  def genre3
    @items = Item.where(genre_id: 3)
  end

  def genre3_1

  end

  def genre3_2

  end

  def genre3_3

  end

  def genre3_4

  end

  def genre4
    @items = Item.where(genre_id: 4)
  end

  def genre4_1

  end

  def genre4_2

  end

  def genre4_3

  end

  def genre4_4

  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end

  def set_genre
    @genre = Genre.find(params[:id])
  end

end
