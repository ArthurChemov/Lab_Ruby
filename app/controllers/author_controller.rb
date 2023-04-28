
class AuthorController < ApplicationController
  before_action :set_author, only: %i[show edit update destroy]
  def index
    @author = Author.paginate(page: params[:page], per_page: 10)
  end

  def new
    @author = Author.new
  end

  def create
    author = Author.new(author_params)

    if author.save
      redirect_to author_path(author)
    else
      @author = author
      render :new
    end
  end

  def show
    @author = Author.find(params[:id])
  end

  def edit
  end

  def update
    if @author.update(author_update_params)
      redirect_to author_path(@author)
    else
      render :edit
    end
  end

  def destroy
    if @author.destroy
      redirect_to author_index_path
    else
      redirect_to author_index_path
    end
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name, :surname, :bio).merge(created_at: Time.now, updated_at: Time.now)
  end

  def author_update_params
    params.require(:author).permit(:name, :surname, :bio).merge(updated_at: Time.now)
  end
end
