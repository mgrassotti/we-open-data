class Italy::Cities::ZipcodesController < ApplicationController
  def index
    @zipcodes = City.pluck(:cap).flatten.sort.uniq
    respond_to do |format|
      format.html
      format.json { render json: @zipcodes }
    end
  end

  def show
    @city = City.find_by!(cap: params[:id])
    respond_to do |format|
      format.html { render 'italy/cities/show'} 
      format.json { render json: @city.to_json(:except => :_id) }
    end
  end
end
