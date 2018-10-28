class Italy::Cities::NamesController < ApplicationController
  def index
    render json: City.pluck(:nome)
  end

  def show
    city = City.where(nome: /^#{Regexp.escape(params[:id])}$/i).first
    raise Mongoid::Errors::DocumentNotFound.new(City, params[:id]) unless city
    render json: city.to_json(:except => :_id) 
  end
end
