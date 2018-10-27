class Cities::NamesController < ApplicationController
  def index
    render json: City.pluck(:nome)
  end

  def show
    render json: City.where(nome: /^#{Regexp.escape(params[:id])}$/i).first.to_json(:except => :_id)
  end
end
