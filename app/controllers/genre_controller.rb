class GenreController < ApplicationController
  def index
    @genre = Genre.all
  end
end
