class LibraryController < ApplicationController
  before_action :set_library, only: %i[show edit update destroy]
  def index
    @library = Library.paginate(page: params[:page], per_page: 10)
  end

  def new
    @library = Library.new
  end

  def create
    library = Library.new(library_params)

    if library.save
      redirect_to library_path(library)
    else
      @library = library
      render :new
    end
  end

  def show
    @library = Library.find(params[:id])
  end

  def edit
  end

  def update
    if @library.update(library_update_params)
      redirect_to library_path(@library)
    else
      render :edit
    end
  end

  def destroy
    if @library.destroy
      redirect_to library_index_path
    else
      redirect_to library_index_path
    end
  end

  private

  def set_library
    @library = Library.find(params[:id])
  end

  def library_params
    params.require(:library).permit(:name, :address).merge(created_at: Time.now, updated_at: Time.now)
  end

  def library_update_params
    params.require(:library).permit(:name, :address).merge(updated_at: Time.now)
  end
end
