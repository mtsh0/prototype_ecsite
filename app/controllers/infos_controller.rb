class InfosController < ApplicationController
  before_action :set_info, except: [:new, :index, :show]

  def index
    @infos = Info.all.page(params[:page]).per(2).reverse_order
    set_layout
  end

  def new
    @info = Info.new
    set_layout
  end

  def create
    @info = Info.new(info_params)

    if @info.save
      binding.pry
      redirect_to infos_path, success: 'お知らせ情報を登録しました'
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @info.update(info_params)
      redirect_to infos_path, success: '変更が完了しました'
    else
      render 'edit'
    end
    set_layout
  end

  def destroy
    if @info.destroy
      redirect_to infos_path, success: "#{@info.created_at}のお知らせを削除しました"
    else
      redirect_to infos_path, danger: 'エラーにより削除できませんでした'
    end
    set_layout
  end

  private

  def set_info
    @info = Info.find(params[:id])
  end

  def info_params
    params.require(:info).permit(:title, :description)
  end
end
