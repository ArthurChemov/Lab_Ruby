class GenreController < ApplicationController
  before_action :set_genre, only: %i[show edit update destroy]
  def index
    @genre = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    genre = Genre.new(genre_params)

    if genre.save
      redirect_to genre_path(genre)
    else
      @genre = genre
      render :new
    end
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def edit
  end

  def update
    if @genre.update(genre_update_params)
      redirect_to genre_path(@genre)
    else
      render :edit
    end
  end

  def destroy
    if @genre.destroy
      redirect_to genre_index_path
    else
      redirect_to genre_index_path
    end
  end

  private

  def set_genre
    @genre = Genre.find(params[:id])
  end

  def genre_params
    params.require(:genre).permit(:name).merge(created_at: Time.now, updated_at: Time.now)
  end

  def genre_update_params
    params.require(:genre).permit(:name).merge(updated_at: Time.now)
  end
end
