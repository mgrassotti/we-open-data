class Italian::Cities::ZipcodesController < ApplicationController
  def index
    @zipcodes = City.pluck(:cap).flatten.sort.uniq
    respond_to do |format|
      format.html
      format.json { render json: @zipcodes }
    end
  end
end
