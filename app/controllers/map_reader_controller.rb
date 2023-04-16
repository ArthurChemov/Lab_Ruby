class MapReaderController < ApplicationController
  def index
    @map_reader = MapReader.all
  end
end
