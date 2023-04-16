class LibraryController < ApplicationController
  def index
    @library = Library.all
  end
end
