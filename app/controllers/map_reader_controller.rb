class MapReaderController < ApplicationController
  before_action :set_map_reader, only: %i[show edit update destroy]
  def index
    @map_reader = MapReader.all
  end

  def new
    @map_reader = MapReader.new
  end

  def create
    map_reader = MapReader.new(map_reader_params)

    if map_reader.save
      redirect_to map_reader_path(map_reader)
    else
      @map_reader = map_reader
      render :new
    end
  end

  def show
    @map_reader = MapReader.find(params[:id])
  end

  def edit
  end

  def update
    if @map_reader.update(map_reader_update_params)
      redirect_to map_reader_path(@map_reader)
    else
      render :edit
    end
  end

  def destroy
    if @map_reader.destroy
      redirect_to map_reader_index_path
    else
      redirect_to map_reader_index_path
    end
  end

  private

  def set_map_reader
    @map_reader = MapReader.find(params[:id])
  end

  def map_reader_params
    params.require(:map_reader).permit(:library_id, :user_id).merge(created_at: Time.now, updated_at: Time.now)
  end

  def map_reader_update_params
    params.require(:map_reader).permit(:library_id, :user_id).merge(updated_at: Time.now)
  end
end
