class ShrinesController < ApplicationController
  def index
    @shirines = Shrine.new
  end
end
