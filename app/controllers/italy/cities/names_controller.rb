class Italy::Cities::NamesController < ApplicationController
  def index
    @names = City.pluck(:nome)
    respond_to do |format|
      format.html
      format.json { render json: @names }
    end
  end
end
