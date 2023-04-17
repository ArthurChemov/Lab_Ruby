class BookController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]
  def index
    @book = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)

    if book.save
      redirect_to book_path(book)
    else
      @book = book
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end

  def update
    if @book.update(book_update_params)
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    if @book.destroy
      redirect_to book_index_path
    else
      redirect_to book_index_path
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :year, :library_id, :author_id, :genre_id).merge(created_at: Time.now, updated_at: Time.now)
  end

  def book_update_params
    params.require(:book).permit(:title, :year, :library_id, :author_id, :genre_id).merge(updated_at: Time.now)
  end
end
