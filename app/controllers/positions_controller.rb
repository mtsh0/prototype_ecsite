class PositionsController < ApplicationController
  before_action :set_position, only: [:show, :edit, :update, :destroy]

  def index
    @positions = Position.all.page(params[:page])
    set_layout
  end

  def show
    set_layout
  end

  def new
    @position = Position.new
    set_layout
  end

   def create
    @position = Position.new(position_params)

    respond_to do |format|
      if @position.save
        format.html { redirect_to @position, notice: '位置情報が削除されました' }
        format.json { render :show, status: :created, location: @position }
      else
        format.html { render :new }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
    set_layout
  end

  def edit
    set_layout
  end

  def update
    respond_to do |format|
      if @position.update(position_params)
        format.html { redirect_to @position, notice: 'Position was successfully updated.' }
        format.json { render :show, status: :ok, location: @position }
      else
        format.html { render :edit }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
    set_layout
  end

  def destroy
    @position.destroy
    respond_to do |format|
      format.html { redirect_to positions_url, notice: 'Position was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_position
      @position = Position.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def position_params
      params.require(:position).permit(:title, :description, :address, :latitude, :longitude)
    end
end
