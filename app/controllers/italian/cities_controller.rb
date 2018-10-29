class Italian::CitiesController < ApplicationController
  def index
    @service = Service.find_by!(name: "Italian Cities")
    respond_to do |format|
      format.html { render file:  "#{Rails.root}/app/views/services/show" } 
      format.json { render json: @service.as_json(base_url: base_url) }
    end
  end

  def show
    @city = City.where(nome: /^#{Regexp.escape(params[:id])}$/i).first ||
      City.find_by(cap: params[:id])
    raise Mongoid::Errors::DocumentNotFound.new(City, params[:id]) unless @city
    respond_to do |format|
      format.html 
      format.json { render json: @city.to_json(:except => :_id) }
    end
  end
end
