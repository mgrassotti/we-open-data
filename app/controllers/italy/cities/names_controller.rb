class Italy::Cities::NamesController < ApplicationController
  def index
    @names = City.pluck(:nome)
    respond_to do |format|
      format.html
      format.json { render json: @names }
    end
  end

  def show
    @city = City.where(nome: /^#{Regexp.escape(params[:id])}$/i).first
    raise Mongoid::Errors::DocumentNotFound.new(City, params[:id]) unless @city
    respond_to do |format|
      format.html
      format.json { render json: @city.to_json(:except => :_id) }
    end
  end
end
