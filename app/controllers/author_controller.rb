class AuthorController < ApplicationController
  def index
    @author = Author.all
  end
end
